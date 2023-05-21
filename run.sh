#!/bin/bash

ANS_DIR="${PWD}/ans"
LOG_DIR="${PWD}/log"
STU_DIR="${PWD}/stu"
TB_DIR="${PWD}/tb"

CHECKER_PY="${PWD}/checker.py"
GRADE_TXT="${LOG_DIR}/grade.txt"
LOG_TXT="${LOG_DIR}/log.txt"

DL_GL="Lab3_D_Latch_gatelevel.v"
DF_GL="Lab3_D_FF_gatelevel.v"
DF_AR="D_FF_AR.v"
CV_SD="Lab3_Converter_state_diagram.v"
CV_ST="Lab3_Converter_structure.v"

rm -f "${GRADE_TXT}"
rm -f "${LOG_TXT}"
cd "${STU_DIR}" || exit 1
for dir in *; do (
    cd "${dir}" || exit 1
    echo "testing [${dir}]"
    {   
        echo "=====[${dir}]====="
        rm -f -- *.txt *.vcd
        echo "(TA's testbench)"
        iverilog "${TB_DIR}/t_dl_spec.v" "${DL_GL}" && ./a.out > "t_dl_spec.txt"
        iverilog "${TB_DIR}/t_dl_rand.v" "${DL_GL}" && ./a.out > "t_dl_rand.txt"
        iverilog "${TB_DIR}/t_df_spec.v" "${DL_GL}" "${DF_GL}" && ./a.out > "t_df_spec.txt"
        iverilog "${TB_DIR}/t_df_rand.v" "${DL_GL}" "${DF_GL}" && ./a.out > "t_df_rand.txt"
        iverilog "${TB_DIR}/t_cv_sd_func.v" "${CV_SD}" && ./a.out > "t_cv_sd_func.txt"
        iverilog "${TB_DIR}/t_cv_sd_cont.v" "${CV_SD}" && ./a.out > "t_cv_sd_cont.txt"
        iverilog "${TB_DIR}/t_cv_sd_rst.v" "${CV_SD}" && ./a.out > "t_cv_sd_rst.txt"
        iverilog "${TB_DIR}/t_cv_st_func.v" "${CV_ST}" "${DF_AR}" && ./a.out > "t_cv_st_func.txt"
        iverilog "${TB_DIR}/t_cv_st_cont.v" "${CV_ST}" "${DF_AR}" && ./a.out > "t_cv_st_cont.txt"
        iverilog "${TB_DIR}/t_cv_st_rst.v" "${CV_ST}" "${DF_AR}" && ./a.out > "t_cv_st_rst.txt"
        iverilog "${TB_DIR}/t_cv_st_arst.v" "${CV_ST}" "${DF_AR}" && ./a.out > "t_cv_st_arst.txt"
        rm -f a.out dl df cv
        echo "(student's testbench)"
        iverilog -o dl t_Lab3_D_Latch_gatelevel.v "${DL_GL}"
        iverilog -o df t_Lab3_D_FF_gatelevel.v "${DL_GL}" "${DF_GL}"
        iverilog -o cv t_Lab3_Converter.v "${CV_SD}" "${CV_ST}" "${DF_AR}"
        echo ""
    } >> "${LOG_TXT}" 2>&1
    {
        echo "=====[${dir}]====="
        python "${CHECKER_PY}" "${ANS_DIR}"
        echo ""
    } >> "${GRADE_TXT}" 2>&1
) done
