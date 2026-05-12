set shell := ["bash", "-uc"]
default: (build)
alias b:= build
set dotenv-load

build:
  uvx rst2pdf -o assets/resume.pdf resume/resume.rst

release: build
  cp assets/resume.pdf "/tmp/vinay-keerthi-resume-v$(date +%F).pdf"
  gh release create "v$(date -u +%Y.%m.%d)" "/tmp/vinay-keerthi-resume-v$(date +%F).pdf"
