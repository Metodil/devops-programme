# devops-programme


## M1-4-2-CI-Practice - GitHub Actions Practice

### Prerequisites

- Organize your git repo to follow the guidelines provides in the presentation&nbsp;✅&nbsp; Ok

### Task description

Create a GitHub Actions pipeline that runs on commit to a feature branch (i.e. not `main`) and performs the following checks on our simple Flask app repository.<br>✅&nbsp; workflow is created in **.github/workflow/ci-pipeline.yaml**

- Check `.editorconfig`&nbsp;✅&nbsp; Ok - test in workflow **editorconfig**
- Code Lint and style - use `pylint` and `black` to check for style/formatting/syntax errors
&nbsp;✅&nbsp; Ok - test in workflow **lint-black** and part in **lint-unit-tests**
- Check makrdown files [markdownlint-cli](https://www.npmjs.com/package/cli-markdown)&nbsp;✅&nbsp; Ok - test in workflow **markdown-link-check**
- Code Unittest - there's a simple unit test next to our app called `app_test.py`. Make sure our unittest passes (`python -m unittest` executed in the app directory)&nbsp;✅&nbsp; Ok - test in workflow last part of **lint-unit-tests**
- Check for hardcoded secrets (`gitleaks`) - not just our app but the whole repository.
    ✅&nbsp; Ok - test in workflow  **gitleaks-security**
    ✅&nbsp; Extra Trivy check repo(fs) - test in workflow  **Trivy-security**
- SAST - SonarCloud; Review code smells and security issues&nbsp;✅&nbsp; Ok - test in workflow  **sonarcloud-security**
- SCA - Snyk; review security issues&nbsp;✅&nbsp; Ok - **integrated** in my github account
- Build a Docker image. Use Git commit SHA as an Image tag.
- Scan the built image with `Trivy`.
    ✅&nbsp; Ok - job in workflow  **build-test** using SHA in tag and test with Trivy
- Push the built image to your Docker HUB account.
    ✅&nbsp; Ok - job in workflow  **deploy** get credential from Hashi vault and push to my dockerhub account
- (optional) Add CONTRIBUTORS guide. Follow [this](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors) document from GitHUb.
    ✅&nbsp; Ok - guide is **added** in root: **CONTRIBUTING.md**

## Extra effort

- Create a pre-commit hook that safeguards for the following
  - hardcoded secrets (`gitleaks`)
  - yamllint
  - check-merge-conflict <https://github.com/pre-commit/pre-commit-hooks>
  - check-added-large-files <https://github.com/pre-commit/pre-commit-hooks>
***
✅&nbsp; Ok - my pre-commit using:
> - id: check-yaml
> - id: end-of-file-fixer
> - id: trailing-whitespace
> - id: check-added-large-files
> - id: check-json
> - id: check-merge-conflict
> - id: gitleaks

- Setup docker-compose with build and run a container&nbsp;✅&nbsp; Ok - created in  **M1-4-2-CI-Practice/compose.yaml**
- Try out GitHub Actions schedule trigger event - <https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule>.
✅&nbsp; Ok - add to workflow
```
  schedule:
    - cron: '0 0 * * 1,4' # on Monday (1) and Thursday (4)
```

***

## M1-3-1 Configuration Management

### Ansible Task

Create an Ansible playbook that build, push and then run the Docker image for the Python
application. Let your playbook has the following variables:

* `image_name` - contains the name of your image without the tag, i.e. `vutoff/python-app`
* `image_tag` - contains the tag you tagged your image with, i.e. `v0.2`
* `listen_port` - contains the listening port you're binding your app to.

Make sure that you set environment variable `PORT` when you define your container
in the Ansible playbook that takes its value from `listen_port` variable.

✅&nbsp; playbook is created in homework/**M1-3-Ansible/u34-ansible-hw.yaml**,
using **branch:** **ansible-practice-and-homework**

extra playbooks in **M1-3-Ansible** :
- u34-ansible-hw-with-ansible-vault.yaml : Secrets management with **Ansible secrets**
- u34-ansible-hw-with-hashi-vault.yaml : Secrets management with **Hashi vault**
- u34-ansible-hw-with-role-hashi-vault.yaml : Using **roles** in Ansible
