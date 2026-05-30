# Source Catalog — dependency-security-scan

Maintained per `sync-skills` governance. Mark a source as **Needs Review** when `Last Evaluated` exceeds the freshness threshold (default: 30 days). Mark **Deprecated** when no longer maintained or relevant.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) | Reference architecture for dependency CVE scanning: manifest parsing, NVD integration, false-positive suppression, and report formats | Authoritative OWASP project for dependency-level vulnerability analysis; defines the standard scan lifecycle this skill operationalises | Yes | 2026-05-06 | Current | Primary conceptual reference for scan workflow design |
| [GitHub Dependabot Documentation](https://docs.github.com/en/code-security/dependabot) | Dependabot alerts, security updates, version updates, grouped PRs, and GitHub Advisory Database integration | Canonical reference for the GitHub-native CVE advisory source used in L2+ scans; covers alert severity classification and automated update behaviour | Yes | 2026-05-06 | Current | Used for GitHub Advisory Database query guidance and alert severity mapping |
| [NIST National Vulnerability Database (NVD)](https://nvd.nist.gov/) | CVE records, CVSS v3.1 scoring, CPE matching, and vulnerability enrichment data | Primary CVE authority; CVSS v3.1 scores from NVD are the normative severity source for this skill's classification tiers | Yes | 2026-05-06 | Current | Normative source for CVSS scoring thresholds (CRITICAL ≥ 9.0, HIGH 7.0–8.9, etc.) |
| [Open Source Vulnerabilities (OSV)](https://osv.dev/) | Cross-ecosystem vulnerability database covering npm, PyPI, NuGet, Go, and others with affected version ranges and aliases to CVE/GHSA IDs | Used for L4 multi-DB cross-reference; provides ecosystem-native vulnerability records that NVD may lag on for newer disclosures | Yes | 2026-05-06 | Current | L4 depth mode only; used to detect advisory conflicts and catch CVEs not yet in NVD |
| [CycloneDX SBOM Specification](https://cyclonedx.org/) | SBOM schema for software component inventory: component types, version evidence, hashes, licenses, and dependency graph format | Normative reference for SBOM structure produced in L3+ depth modes; ensures SBOM outputs are interoperable with downstream tooling | Yes | 2026-05-06 | Current | Used for SBOM artifact schema design in L3 and L4 outputs |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is no longer maintained or relevant, mark In Use as No and Current Status as Deprecated.
