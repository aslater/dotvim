import os, sys, shutil
from subprocess import call

def build_ycm_conf(flags_filename):
   script_path = os.path.dirname(os.path.realpath(__file__))
   ycm_base_path = os.path.join(script_path, "ycm_extra_conf_base.py")
   shutil.copyfile(ycm_base_path, ".ycm_extra_conf.py")

   fin = open(flags_filename, "r")
   fout = open(".ycm_extra_conf.py", "a")

   print ""
   print >>fout, "flags = ["
   for line in fin:
      line = line.rstrip()
      print >>fout, r"   '" + line + r"',"

   print >>fout, "]"
   fout.close()
   fin.close()


# Call this from the 'dev' directory; it'll use the HARRIER_ASIC compile options
def main():

   os.chdir(os.path.join("variants","HARRIER_ASIC"))
   call(["make", "build_flags"])
   os.chdir(os.path.join("..",".."))
   ccdef_path = os.path.join("build", "ds5", "HARRIER_ASIC", "dev", "bin", "compile_defines.txt")

   f = open(ccdef_path, "a")
   print >>f, "-std=c99"
   f.close()

   shutil.copyfile(ccdef_path, ".syntastic_cpp_config")
   shutil.copyfile(ccdef_path, ".syntastic_c_config")
   build_ycm_conf(ccdef_path)

if __name__ == "__main__":
   main()
