# Security Audit & Compliance

A comprehensive security framework assessment and remediation plan for a healthcare IT organization processing sensitive provider data as a federal government contractor.

## Overview

This project evaluates the security posture of a healthcare IT company responsible for digitizing healthcare system data for hundreds of doctors. The organization processes sensitive PII including social security numbers and home addresses while operating under federal government contracts. The assessment identified critical security gaps and developed structured remediation plans aligned with NIST SP 800-53, FISMA, and PCI-DSS requirements.

## Key Findings

### Critical Security Gaps Identified

| Control | Risk Level | Issue |
|---------|-----------|-------|
| **AC-6 (Least Privilege)** | HIGH | Users across departments have excessive permissions and administrative privileges |
| **CA-7 (Continuous Monitoring)** | HIGH | No real-time monitoring, operating in reactive mode only |
| **RA-3 (Risk Assessment)** | HIGH | Outdated security documentation; no formal risk assessment process |
| **CA-5 (Plan of Action & Milestones)** | MODERATE | No structured plan to track risk mitigation activities |
| **RA-7 (Risk Response)** | MODERATE | Informal risk response slowing decision-making |

### Additional Vulnerabilities
- No multi-factor authentication (MFA) implemented
- Outdated and unlicensed endpoint devices
- Inadequate antivirus protection on workstations
- No defense-in-depth or zero-trust architecture
- Security documentation not updated

## Remediation Plans

### Access Control (AC-6)
- Deploy identity and access management system with granular RBAC
- Implement quarterly access reviews
- Require manager approval for new system access
- Automate onboarding/offboarding processes

### Continuous Monitoring (CA-7)
- Deploy SIEM platform for centralized log collection and analysis
- Implement network monitoring with automated threat detection
- Configure real-time mobile alerts for critical security events
- Integrate healthcare-specific threat intelligence feeds
- Prioritize monitoring on systems handling doctor credentials and government portals

### Risk Assessment (RA-3)
- Conduct comprehensive security risk assessment per NIST SP 800-30
- Complete inventory of all assets handling PII
- Perform network-wide vulnerability assessment
- Maintain risk register with quantitative and qualitative metrics
- Establish formal risk tolerance policies

### Risk Response (RA-7)
- Define formal risk treatment strategies: mitigation, avoidance, transfer, acceptance
- Establish tiered decision-making authority
- Require documented justification for all risk treatment decisions
- Create implementation plans with responsibilities and timelines

### Plan of Action & Milestones (CA-5)
- Deploy centralized security tracking system integrated with scanning tools
- Create standardized documentation forms for security issues
- Assign dedicated personnel for tracking and monthly reporting
- Implement automated deadline reminders

## PCI-DSS Compliance Strategy

Designed compliance implementation for credit card payment processing covering three key PCI-DSS requirements:

### Requirement 1: Network Firewalls
- Network segmentation separating payment systems from business networks
- Deny-by-default firewall rules with quarterly reviews
- Defined RACI matrix: CISO, Network Security Admin, IT Ops Manager, Compliance Officer

### Requirement 2: Secure Configuration
- Elimination of all default passwords and settings
- Removal of unnecessary software and services
- Standardized security configuration baselines
- Defined RACI matrix: System Admin, Security Admin, IT Manager, QA

### Requirement 6: Anti-Virus Protection
- Enterprise anti-virus on all payment systems
- Automatic updates and real-time scanning
- Healthcare-specific threat intelligence integration
- Defined RACI matrix: Cybersecurity Analyst, Desktop Support, IT Security Manager, IR Coordinator

## Compliance Frameworks

| Framework | Application |
|-----------|-------------|
| **NIST SP 800-53 Rev. 5** | Security and privacy controls baseline |
| **FISMA** | Federal information security compliance |
| **PCI-DSS v4.0** | Payment card data security |
| **NIST SP 800-137** | Continuous monitoring guidance |
| **NIST SP 800-30 Rev. 1** | Risk assessment methodology |
| **NIST SP 800-39** | Enterprise risk management |
| **FIPS 200** | Minimum security requirements |
| **OMB Circular A-130** | Federal information security programs |

## Technologies & Tools

- **IAM:** Role-Based Access Control (RBAC), MFA, Privileged Access Management
- **Monitoring:** SIEM, Network Monitoring, Threat Intelligence Feeds
- **Endpoint:** Enterprise Antivirus, Endpoint Detection & Response
- **Compliance:** NIST CSF, PCI-DSS Assessment Tools
- **Architecture:** Defense-in-Depth, Zero Trust

## Audit Methodology

The assessment followed a structured four-phase approach:

1. **Scope Definition:** Identified all systems processing PII (doctor credentials, SSNs, home addresses) and mapped data flows between the organization, healthcare providers, and federal government portals.
2. **Control Baseline Mapping:** Mapped the organization's existing controls against NIST SP 800-53 Rev. 5. Each control family was evaluated for implementation status: Implemented, Partially Implemented, or Not Implemented.
3. **Gap Analysis & Risk Scoring:** Gaps were scored using NIST SP 800-30 Rev. 1 methodology — combining likelihood of exploitation with potential impact to determine risk level (High, Moderate, Low).
4. **Remediation Prioritization:** Controls were prioritized based on (a) risk score, (b) regulatory exposure, and (c) implementation complexity. Quick wins with high risk reduction were scheduled first.

## Risk Prioritization Rationale

### Why AC-6 (Least Privilege) was prioritized first
Excessive permissions were the single highest-risk finding because they create a **force multiplier for every other vulnerability.** A compromised account with admin privileges can disable monitoring (CA-7), alter risk documentation (RA-3), and exfiltrate PII — effectively negating all other controls. Fixing access control first reduces the blast radius of any subsequent breach.

### Why CA-7 (Continuous Monitoring) was second
The organization operated in **purely reactive mode** — security incidents were only discovered when users reported problems. Without real-time visibility, the mean time to detect (MTTD) was effectively unbounded. SIEM deployment provides the detection capability that makes all other controls auditable and enforceable.

### Why RA-3 (Risk Assessment) before CA-5 and RA-7
You cannot build a meaningful Plan of Action (CA-5) or Risk Response strategy (RA-7) without first understanding what risks exist. The outdated security documentation meant leadership was making risk decisions based on assumptions rather than data. A formal risk assessment provides the evidence base for all downstream remediation planning.

## Remediation Impact Analysis

| Control Gap | If Left Unaddressed | Regulatory Exposure | Estimated Remediation Cost |
|------------|-------------------|--------------------|-----------------------------|
| **AC-6 (Least Privilege)** | Any compromised credential provides full system access; insider threat risk is critical | FISMA non-compliance, potential contract termination | Medium (IAM tooling + quarterly reviews) |
| **CA-7 (Continuous Monitoring)** | Breaches go undetected for weeks/months; no forensic evidence for incident response | FISMA CA-7, NIST SP 800-137 violation | High (SIEM platform + analyst staffing) |
| **RA-3 (Risk Assessment)** | Risk decisions based on outdated assumptions; unable to demonstrate due diligence | FISMA RA-3, OMB A-130 reporting failure | Low (assessment engagement + documentation) |
| **CA-5 (POA&M)** | No tracking of remediation progress; audit findings repeat year-over-year | FISMA audit findings, contract risk | Low (tracking system + process definition) |
| **RA-7 (Risk Response)** | Ad-hoc risk decisions with no documentation; inconsistent treatment of similar risks | NIST SP 800-39 non-alignment | Low (policy + decision framework) |

## Skills Demonstrated

`Security Auditing` `NIST SP 800-53 Rev. 5` `Risk Assessment (NIST SP 800-30)` `Gap Analysis` `Remediation Planning` `PCI-DSS v4.0 Compliance` `FISMA Compliance` `Access Control Design` `SIEM Architecture` `RACI Matrix Development` `GRC Documentation` `Healthcare Security`

## Author

**Koffi Jean-Marie Amedjonekou**
Cybersecurity Engineer

## License

This project is shared for educational and portfolio purposes.
