#!/bin/bash

rsync -avv --exclude=.git/ --exclude=.DS_Store --exclude=other/ --exclude=README.md . ~;
