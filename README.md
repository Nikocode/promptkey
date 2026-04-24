---
doc_family: product_and_external
doc_kind: privacy_reference
doc_status: active
doc_canonical: true
---
# PromptKey Site

This folder is a minimal static site for PromptKey, a local dictation utility for Apple silicon/ARM64 macOS systems, including compatible MacBook Neo setups.

It currently contains:

- `index.html`
  - local/direct-build landing page prototype
- `privacy/index.html`
  - public privacy policy page
- `terms/index.html`
  - public terms of service page
- `refunds/index.html`
  - public refund policy page

## Local Preview

Any static file server is fine. For example:

```bash
python3 -m http.server 4173 --directory docs/privacy-site
```

Then open:

- `http://127.0.0.1:4173/`
- `http://127.0.0.1:4173/privacy/`
- `http://127.0.0.1:4173/terms/`
- `http://127.0.0.1:4173/refunds/`

## QA

Static sanity check:

```bash
scripts/dev/check_privacy_site.sh
```

That verifies:

- required files exist
- local asset references resolve
- anchor links point at real sections
- the landing page still contains the core hero/proof/unlock surfaces

Manual browser pass before publish:

- load `/`, `/privacy/`, `/terms/`, and `/refunds/` on desktop and mobile widths
- confirm videos, thumbnails, and screenshots render
- confirm the price, privacy link, terms link, refund link, and support email are visible
- confirm the checkout/buy path is the intended live destination before shipping

## Publish On GitHub Pages

### Option 1: Dedicated repo

1. Create a public repo such as `promptkey-privacy`.
2. Copy the contents of this folder into the repo root.
3. In GitHub, enable **Pages** from the default branch root.
4. Use the resulting URL in App Store Connect.

### Option 2: Existing site repo

1. Copy `index.html` into the privacy path for your site, for example:
   - `privacy/index.html`
2. Deploy your site normally.
3. Use the stable public URL in App Store Connect.

## Requirement Notes

For App Store purposes, the important parts are:

- the marketing/support page is public
- the privacy policy URL is public and stable
- the hosted privacy policy matches the in-app privacy policy

For direct-commerce review flows such as Lemon Squeezy, the important parts are:

- the landing page is public
- the landing page links clearly to Terms of Service, Privacy Policy, and Refund Policy
- the product pricing and support contact are visible

GitHub Pages is usually fine for this requirement if those conditions are true.
