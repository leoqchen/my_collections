#!/bin/bash

set -x #echo command executed

clone()
{
  if [ ! -e $2 ]; then
    git clone --recursive $1 $2

    # other optional 
    if [ ! -z "$3" ]; then
      eval "$3"
    fi
  fi
}


# gl
#-----------
clone https://github.com/JoeyDeVries/LearnOpenGL.git gl/LearnOpenGL
clone git://anongit.freedesktop.org/git/mesa/demos gl/mesa_demos_cmake
clone https://gitlab.freedesktop.org/mesa/demos.git gl/mesa_demos_meson
clone https://github.com/danginsburg/opengles3-book.git gl/opengles3-book
clone https://github.com/g-truc/ogl-samples.git gl/ogl-samples
clone https://github.com/leoqchen/openglrb4.git gl/openglrb4
clone https://github.com/openglsuperbible/sb7code.git gl/openglsb7 "cd gl/openglsb7/; git apply ../sb7code.patch; cd ../../"
clone https://github.com/capnramses/antons_opengl_tutorials_book.git gl/antons_opengl_tutorials_book
clone https://github.com/glfw/glfw.git gl/glfw
clone https://github.com/freeglut/freeglut.git gl/freeglut
clone https://gitlab.freedesktop.org/mesa/glu.git gl/glu
clone https://github.com/KhronosGroup/VK-GL-CTS.git gl/VK-GL-CTS
clone https://gitlab.freedesktop.org/mesa/piglit gl/piglit

if [ ! -e gl/superbible7-media.zip ]; then
  cd gl; wget http://openglsuperbible.com/files/superbible7-media.zip; unzip superbible7-media.zip -d openglsb7/bin/media/; cd ../
fi

# vulkan
#-----------
clone https://github.com/KhronosGroup/Vulkan-Samples.git vulkan/Vulkan-Samples
clone https://github.com/Overv/VulkanTutorial.git vulkan/VulkanTutorial
clone "https://github.com/vblanco20-1/vulkan-guide.git -b all-chapters-2" vulkan/vulkan-guide

# shader
#-----------
clone https://github.com/KhronosGroup/glslang.git shader/glslang "cd shader/glslang; ./update_glslang_sources.py; cd ../../"

# math
#----------
clone https://github.com/datenwolf/linmath.h.git math/linmath.h
clone https://github.com/g-truc/glm.git math/glm

# asset
#----------
clone https://github.com/nothings/stb.git asset/stb
clone https://github.com/richgel999/jpeg-compressor.git asset/jpeg-compressor
clone https://github.com/pnggroup/libpng.git asset/libpng
clone https://github.com/assimp/assimp.git asset/assimp

# perf
#-----------
clone https://github.com/brendangregg/FlameGraph.git perf/FlameGraph

# cmake
#-----------
if [ ! -d cmake/cmake-3.28.3-tutorial-source ]; then
  cd cmake; unzip -q cmake-3.28.3-tutorial-source.zip;  cd ../
fi

# ReverseEngineering
#--------------------
clone https://github.com/envytools/valgrind.git RE/valgrind-mmt
if [ ! -e RE/renouveau ]; then
  mkdir -p RE
  cd RE
  cvs -z3 -d:pserver:anonymous@nouveau.cvs.sourceforge.net:/cvsroot/nouveau co -P renouveau
  cd ..
fi


# C 
#--------------------
clone https://github.com/stclib/STC.git c/STC


# hook
#--------------------
clone https://github.com/yasukata/zpoline.git hook/zpoline

# SoftRenderer
#--------------------
clone https://github.com/cadenji/foolrenderer.git SoftRenderer/foolrenderer
clone https://github.com/zauonlok/renderer.git SoftRenderer/renderer
clone https://github.com/ssloy/tinyrenderer.git SoftRenderer/tinyrenderer
clone https://github.com/keith2018/SoftGLRender.git SoftRenderer/SoftGLRender
clone https://github.com/keith2018/spvm SoftRenderer/spvm
clone https://github.com/C-Chads/tinygl.git SoftRenderer/tinygl_C-Chads

if [ ! -d SoftRenderer/TinyGL ]; then
  cd SoftRenderer; tar xf TinyGL-0.4.1.tar.gz; cd ../
fi

# GUI
#--------------------
clone https://github.com/ocornut/imgui.git gui/imgui

# CUDA
#--------------------
clone https://github.com/NVIDIA-developer-blog/code-samples.git cuda/cuda-code-samples
clone https://github.com/vosen/ZLUDA.git cuda/ZLUDA
clone https://github.com/gpgpu-sim/gpgpu-sim_distribution.git cuda/gpgpu-sim_distribution
