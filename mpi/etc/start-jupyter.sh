#!/bin/bash

#nohup jupyter-lab --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.allow_origin="*" --NotebookApp.base_url="${NB_PREFIX:-/}" > /dev/null 2>&1 &
#nohup jupyter-lab --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.token="${JUPYTER_TOKEN}" --NotebookApp.allow_origin="*" --NotebookApp.base_url="${NB_PREFIX:-/}" > /dev/null 2>&1 &
function juplab() {
  jupyter-lab --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.allow_origin="*" --NotebookApp.base_url="${NB_PREFIX:-/}"
}

function juplabbg() {
  nohup jupyter-lab --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.allow_origin="*" --NotebookApp.base_url="${NB_PREFIX:-/}" > /dev/null 2>&1 &
  echo "JupyterLab server started."
}
