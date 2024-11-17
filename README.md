# devops-programme


## M1-4-2-CI-Practice - GitHub Actions Practice

### Prerequisites

- Organize your git repo to follow the guidelines provides in the presentation&nbsp;✅&nbsp; Ok

### Task description

Create a GitHub Actions pipeline that runs on commit to a feature branch (i.e. not `main`) and performs the following checks on our simple Flask app repository.
<br>
✅&nbsp; workflow is created in .github/workflow/ci-pipeline.yaml

- Check `.editorconfig`&nbsp;✅&nbsp; Ok - test in workflow *editorconfig*
- Code Lint and style - use `pylint` and `black` to check for style/formatting/syntax errors&nbsp;✅&nbsp; Ok - test in workflow *lint-black* and part in *lint-unit-tests*
- Check makrdown files [markdownlint-cli](https://www.npmjs.com/package/cli-markdown)&nbsp;✅&nbsp; Ok - test in workflow *markdown-link-check*
- Code Unittest - there's a simple unit test next to our app called `app_test.py`. Make sure our unittest passes (`python -m unittest` executed in the app directory)&nbsp;✅&nbsp; Ok - test in workflow last part of *lint-unit-tests*
- Check for hardcoded secrets (`gitleaks`) - not just our app but the whole repository.
<br>
✅&nbsp; Ok - test in workflow  *gitleaks-security*
✅&nbsp; Extra Trivy check repo(fs) - test in workflow  *Trivy-security
- SAST - SonarCloud; Review code smells and security issues&nbsp;✅&nbsp; Ok - test in workflow  *sonarcloud-security*
- SCA - Snyk; review security issues&nbsp;✅&nbsp; Ok - integrated in my github account
- Build a Docker image. Use Git commit SHA as an Image tag.
- Scan the built image with `Trivy`
<br>
✅&nbsp; Ok - job in workflow  *build-test* using SHA in tag and test with Trivy
- Push the built image to your Docker HUB account
<br>
✅&nbsp; Ok - job in workflow  *deploy* get credential from Hashi vault and push to my dockerhub account
- (optional) Add CONTRIBUTORS guide. Follow [this](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors) document from GitHUb.
<br>
✅&nbsp; Ok - guide is added in root: CONTRIBUTING.md

## Extra effort

- Create a pre-commit hook that safeguards for the following
  - hardcoded secrets (`gitleaks`)
  - yamllint
  - check-merge-conflict <https://github.com/pre-commit/pre-commit-hooks>
  - check-added-large-files <https://github.com/pre-commit/pre-commit-hooks>
<br>
✅&nbsp; Ok - my pre-commit using:
> - id: check-yaml
> - id: end-of-file-fixer
> - id: trailing-whitespace
> - id: check-added-large-files
> - id: check-json
> - id: check-merge-conflict
> - id: gitleaks

- Setup docker-compose with build and run a container&nbsp;✅&nbsp; Ok - created in  M1-4-2-CI-Practice/compose.yaml
- Try out GitHub Actions schedule trigger event - <https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule>
<br>
✅&nbsp; Ok - add to workflow
```
  schedule:
    - cron: '0 0 * * 1,4' # on Monday (1) and Thursday (4)
```
