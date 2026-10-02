# Clarity Software Solutions Website

The website for **Clarity Software Solutions Limited**, an independent software consultancy based in the Thames Valley, UK.

The site showcases Clarity Software Solutions' software engineering expertise, services, technology stack and selected client work, with a focus on Kotlin, Java, Spring Boot and modern web technologies.

**Live website:** [https://claritysoftware.co.uk/](https://claritysoftware.co.uk/)

---

## Overview

This repository contains the source code and infrastructure configuration for the Clarity Software Solutions website.

The website is a lightweight, static site built with HTML and Tailwind CSS. The project deliberately keeps the frontend simple, with no application framework or runtime backend required.

The repository also contains Terraform configuration for managing the AWS infrastructure used to host the website.

### Website sections

The website currently includes:

* **Home** — company overview and introduction
* **Services** — consultancy and software engineering services
* **Contact** — contact information and enquiry details
* **Process** — discovery, planning, development and delivery approach
* **Expertise** — backend, frontend and software quality capabilities
* **Our Work** — examples of previous client projects
* **Technologies** — key technologies and tools used by the consultancy

The homepage highlights experience with Kotlin, Java, Spring Boot, REST APIs, JPA, asynchronous messaging, TypeScript, JavaScript, Node.js, Express, Docker and modern web development.

---

## Technology Stack

### Frontend

* HTML5
* CSS
* [Tailwind CSS](https://tailwindcss.com/)
* Responsive design
* Modern browser standards

### Development tooling

* Node.js 24
* npm
* BrowserSync
* PostCSS
* Autoprefixer
* cssnano

### Infrastructure

* [Terraform](https://www.terraform.io/)
* AWS
* ACME
* TLS

The Terraform configuration currently uses the AWS, ACME and TLS providers and is configured for the `eu-west-2` AWS region.

---

## Repository Structure

```text
.
├── .github/
│   └── workflows/       # GitHub Actions workflows
│
├── src/
│   ├── css/             # Source stylesheets
│   ├── images/          # Website images and technology logos
│   ├── index.html       # Homepage
│   ├── services.html    # Services page
│   ├── contact-us.html  # Contact page
│   ├── robots.txt       # Search engine crawler configuration
│   └── info.json        # Build/version information
│
├── terraform/            # AWS infrastructure configuration
│
├── public/               # Generated website output
│
├── package.json           # npm scripts and dependencies
├── package-lock.json      # Locked npm dependency versions
├── .nvmrc                # Node.js version
└── README.md
```

> `public/` is generated as part of the build process and should generally not be edited directly. Make changes to the files under `src/` instead.

---

## Prerequisites

Before working on the project locally, install:

* **Node.js 24**
* **npm**
* **Git**

The required Node.js major version is defined in `.nvmrc`.

If you use [nvm](https://github.com/nvm-sh/nvm), you can switch to the correct version with:

```bash
nvm use
```

If Node.js 24 is not installed:

```bash
nvm install 24
nvm use 24
```

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/ClaritySoftwareSolutions/clarity-web.git
cd clarity-web
```

Install the dependencies:

```bash
npm install
```

---

## Local Development

The project includes a development workflow that:

1. Copies the source HTML and assets into `public/`
2. Compiles Tailwind CSS
3. Watches source files for changes
4. Runs BrowserSync
5. Automatically refreshes the browser when files change

Start the development environment with:

```bash
npm run dev
```

BrowserSync will serve the generated `public/` directory locally.

The development scripts are defined in `package.json`.

---

## Available npm Scripts

| Command            | Description                                                        |
| ------------------ | ------------------------------------------------------------------ |
| `npm run dev`      | Build the initial site, start file watchers and launch BrowserSync |
| `npm run build`    | Create a production-ready build                                    |
| `npm run serve`    | Serve the existing `public/` directory using BrowserSync           |
| `npm run tailwind` | Compile Tailwind CSS and copy HTML files                           |
| `npm run copy`     | Copy source assets into `public/`                                  |
| `npm run watch`    | Watch source files for changes                                     |
| `npm run replace`  | Replace build metadata placeholders                                |
| `npm run clean`    | Remove the generated `public/` directory                           |

The production build performs the following steps:

```text
clean
  ↓
Tailwind compilation
  ↓
Copy HTML and assets
  ↓
Build metadata replacement
  ↓
PostCSS / minification
```

The build also replaces:

* `{{ VERSION }}` with the current Git commit SHA
* `{{ BUILD_DATE }}` with the date of the latest Git commit

These values are written into `public/info.json`.

---

## Production Build

To create a production build:

```bash
npm run build
```

The generated website will be placed in:

```text
public/
```

You can then serve the production output locally with:

```bash
npm run serve
```

---

## Making Changes

Website source files live under `src/`.

### HTML

Page content can be edited directly in the HTML files:

```text
src/index.html
src/services.html
src/contact-us.html
```

### CSS

The site's styles are maintained under:

```text
src/css/
```

Tailwind is compiled into:

```text
public/css/styles.css
```

Do not edit the generated CSS directly.

### Images

Website images and technology logos are stored under:

```text
src/images/
```

They are copied into the generated `public/` directory during the build.

---

## Build Metadata

The source `src/info.json` contains placeholders:

```json
{
  "version": "{{ VERSION }}",
  "build-date": "{{ BUILD_DATE }}"
}
```

During a build these are replaced with information from Git:

```text
VERSION    → latest Git commit SHA
BUILD_DATE → date of the latest Git commit
```

This provides a simple way to identify which source revision produced a deployed website.

---

## Infrastructure

Infrastructure configuration is contained within:

```text
terraform/
```

The Terraform configuration currently uses:

* AWS provider
* ACME provider
* TLS provider

Terraform is configured to use AWS `eu-west-2` and an S3 backend for Terraform state.

### Terraform initialisation

From the repository root:

```bash
cd terraform
terraform init
```

Before making infrastructure changes, review the Terraform configuration and ensure the appropriate AWS credentials and permissions are available.

### Planning changes

```bash
terraform plan
```

### Applying changes

```bash
terraform apply
```

### Formatting

Terraform files should be formatted using:

```bash
terraform fmt -recursive
```

> Infrastructure changes should be reviewed carefully before applying them to any shared or production environment.

---

## Deployment

The repository contains GitHub Actions configuration under:

```text
.github/workflows/
```

The general deployment flow is based around the following concepts:

```text
Source
  │
  ├── HTML
  ├── CSS / Tailwind
  └── Images
       │
       ▼
   npm run build
       │
       ▼
    public/
       │
       ▼
   AWS infrastructure
```

For infrastructure-related deployments, Terraform is used to manage the underlying AWS resources.

> Deployment credentials, AWS credentials and other secrets should never be committed to the repository.

---

## Content & SEO

The website includes standard metadata for search engines and social sharing, including:

* Page titles
* Meta descriptions
* Canonical URLs
* Open Graph metadata
* Twitter/X metadata
* Responsive viewport configuration
* `robots.txt`
* Favicon and Apple touch icon

The homepage also contains structured navigation between the main website pages.

---

## External Assets

Some website imagery is sourced from Unsplash and includes attribution directly within the relevant page content.

When replacing or adding externally sourced assets, ensure that the appropriate licensing and attribution requirements are respected.

---

## Development Guidelines

When contributing changes:

1. Make source changes under `src/`.

2. Do not manually modify generated files in `public/`.

3. Run the production build before committing:

   ```bash
   npm run build
   ```

4. Check the generated site locally:

   ```bash
   npm run serve
   ```

5. Verify navigation and responsive behaviour.

6. Check that images and other static assets load correctly.

7. Review the generated diff before committing.

---

## Quality Checklist

Before opening a pull request, check:

* [ ] `npm install` completes successfully
* [ ] `npm run build` completes successfully
* [ ] The site loads locally
* [ ] All navigation links work
* [ ] Images load correctly
* [ ] Pages work on mobile and desktop layouts
* [ ] No unnecessary generated files have been manually modified
* [ ] Terraform changes have been formatted with `terraform fmt`
* [ ] No credentials or secrets have been committed

---

## Company

**Clarity Software Solutions Limited**

Independent software consultancy specialising in Java, Kotlin, Spring Boot and modern web technologies.

**Website:** [https://claritysoftware.co.uk/](https://claritysoftware.co.uk/)

**GitHub:** [https://github.com/ClaritySoftwareSolutions](https://github.com/ClaritySoftwareSolutions)

---

## License

No explicit open-source license is currently declared in `package.json` or the repository metadata.

Unless a separate licence has been provided by Clarity Software Solutions Limited, the contents of this repository should be treated as proprietary and should not be redistributed or reused without permission.

---

## Maintainers

Maintained by **Clarity Software Solutions Limited**.

For enquiries relating to the website or repository, please use the contact details provided on the company website.
