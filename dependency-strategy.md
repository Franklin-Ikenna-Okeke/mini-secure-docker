# Dependency Security Strategy

## Overview
A Software Composition Analysis (SCA) scan identified vulnerabilities in
Flask, Werkzeug, and pip dependencies.

## pip
- Upgraded during image build
- Used only at build time
- No runtime exposure
- Action: Mitigated

## Flask
- Version: 2.0.1
- Severity: HIGH (session-related vulnerability)
- Context: Application does not use sessions or authentication
- Action: Risk accepted temporarily
- Plan: Upgrade Flask in a future iteration

## Werkzeug
- Version: 2.0.3
- Multiple DoS-related vulnerabilities
- Constraint: Flask 2.0.1 compatibility
- Action: Deferred until Flask upgrade

## Conclusion
Dependency upgrades are coordinated to avoid breaking functionality.
Security risk is reduced through container hardening and limited exposure.
