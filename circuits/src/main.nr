fn main(secret_share: Field, public_offset: pub Field) {
    let recovery_score = secret_share * 2 + public_offset;

    // Hardcoded recovery threshold policy
    let recovery_threshold = 17;

    // Enforce strict equality for recovery
    assert(recovery_score == recovery_threshold);
}
