function! TestAtCoderSample()
    let tmpdir = tempname()
    let res_mkdir = system("mkdir -p " . tmpdir)
    if v:shell_error == 0
        let contest = expand("%:p:h:t")
        let problem = expand("%:r")
        let url = "https://atcoder.jp/contests/" . contest . "/tasks/" . contest . "_" . problem
        let src_path = expand("%:p")
        let exe_path = tmpdir . "/exe"
        let res_compile = system("g++ " . src_path . " -O2 -o " . exe_path)
        if v:shell_error == 0
            let res_dl = system("oj dl -d " . tmpdir . " " . url)
            if v:shell_error == 0
                let res_judge = system("oj test -c '" . exe_path . "' -d " . tmpdir)
                echo res_judge
            else
                echo "[error] download failed!"
            endif
        else
            echo "[error] compile failed!"
        endif
    else
        echo "[error] mkdir failed!"
    endif
endfunction

command! TestSample call TestAtCoderSample()
