import os, sys, shutil
from subprocess import call

# Call this from the 'dev' directory; it'll use the HARRIER_ASIC compile options

os.chdir(os.path.join("variants","HARRIER_ASIC"))
call(["make", "build_flags"])
os.chdir(os.path.join("..",".."))
shutil.copyfile(os.path.join("build", "ds5", "HARRIER_ASIC", "dev", "bin", "compile_defines.txt"), ".clang_complete")
shutil.copyfile(os.path.join("build", "ds5", "HARRIER_ASIC", "dev", "bin", "compile_defines.txt"), ".syntastic_cpp_config")
shutil.copyfile(os.path.join("build", "ds5", "HARRIER_ASIC", "dev", "bin", "compile_defines.txt"), ".syntastic_c_config")
