set shell := ["bash", "-uc"]
default: (build)
alias b:= build
set dotenv-load

build:
  rst2pdf -o build/resume.pdf resume/resume.rst

release: build
  cp build/resume.pdf "/tmp/vinay-keerthi-resume-v$(date +%F).pdf"
  gh release create "v$(date -u +%Y.%m.%d)" "/tmp/vinay-keerthi-resume-v$(date +%F).pdf"
