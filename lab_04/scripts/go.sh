#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

bash "$SCRIPT_DIR"/build_apps.sh
bash "$SCRIPT_DIR"/update_data.sh
bash "$SCRIPT_DIR"/make_preproc.sh
bash "$SCRIPT_DIR"/make_postproc.sh
