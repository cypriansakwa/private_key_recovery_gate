# 🔐 Private Key Recovery Gate 

This project implements a simple **zero-knowledge circuit** that enforces a private key recovery condition using Noir and Barretenberg. A user can only generate a valid proof if they know a `secret_share` that satisfies a strict mathematical constraint.

---

 ## 🗂️ Project Structure

- `/circuits` — Contains the Noir circuit and logic.
- `/contract` — Foundry project with Solidity verifier and test contract.
- `/js` — JavaScript code for generating and saving proofs using `bb.js`.

Tested with:
- Noir `v1.0.0-beta.6`
- `bb` CLI `v0.84.0`
---
## ✅ Example Inputs
- `secret_share = 7`
- `public_offset = 3`
```
### Installation / Setup
```ssh
# Foundry
git submodule update

# Build circuits, generate verifier contract
(cd circuits && ./build.sh)

# Install JS dependencies
(cd js && yarn)

```

## Proof generation in JS


```ssh
# Use bb.js to generate proof and save to a file
(cd js && yarn generate-proof)

# Run foundry test to read generated proof and verify
(cd contract && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)

```

## Proof generation with bb cli

```ssh
cd circuits

# Generate witness
nargo execute

# Generate proof
bb prove -b ./target/private_key_recovery_gate.json -w target/private_key_recovery_gate.gz -o ./target --oracle_hash keccak

# Run foundry test to read generated proof and verify
cd ..
(cd contract && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)
```
## 🔁 Dual Workflow Support (CLI and JS)

The project supports two approaches for generating proofs:

- **JavaScript-based workflow** using `bb.js`
- **CLI-based workflow** using `nargo` and `bb` directly

## 🛠 Building the Solidity Verifier
Use the `build.sh` script to compile the circuit and generate the Solidity verifier:
```bash
./build.sh
```
This will:
- Compile the Noir circuit
- Generate the verification key (`vk`)
- Export the Solidity verifier to `contract/Verifier.sol`


## 🧭 Ecosystem Attribution

This project is indexed in the [Electric Capital Crypto Ecosystems Map](https://github.com/electric-capital/crypto-ecosystems).

**Source**: Electric Capital Crypto Ecosystems  
**Link**: [https://github.com/electric-capital/crypto-ecosystems](https://github.com/electric-capital/crypto-ecosystems)  
**Logo**: ![Electric Capital Logo](https://avatars.githubusercontent.com/u/44590959?s=200&v=4)

💡 _If you’re working in open source crypto, [submit your repository here](https://github.com/electric-capital/crypto-ecosystems) to be counted._

Thank you for contributing and for reading the contribution guide! ❤️
