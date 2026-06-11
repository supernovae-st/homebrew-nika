# Security Policy

This repository is the **Homebrew tap for Nika**. It is supply-chain
critical · the formula pins release artifacts by URL + SHA-256, and a
compromised formula would ship to every `brew install` consumer.

## Supported Versions

Only the formula on `main` is supported. Formulas track real engine
release tags — never branches or moving artifacts.

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub
issues, discussions, or pull requests.**

Send an email to **security@supernovae.studio** with ·

- A description of the issue (e.g. checksum mismatch · URL hijack risk ·
  formula executing unexpected post-install steps)
- Steps to reproduce
- The formula version / commit SHA where you observed it

We acknowledge receipt within **72 hours** and aim for a substantive
response (initial triage + ETA) within **7 days**. Supply-chain reports
on this tap are treated as highest severity.

## Disclosure Process

1. **Triage** · maintainers verify the report and confirm the scope
2. **Fix development** · patch authored privately
3. **Public release** · GitHub Security Advisory · formula revved
4. **Credit** · reporter named in the advisory unless anonymity is requested

We aim for **≤90 days** between report and public disclosure, shorter for
actively-exploited issues.
