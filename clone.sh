#!/bin/bash

mkdir -p gl
cd gl
git clone https://github.com/JoeyDeVries/LearnOpenGL.git
git clone git://anongit.freedesktop.org/git/mesa/demos mesa_demo
git clone https://github.com/danginsburg/opengles3-book.git
git clone https://github.com/g-truc/ogl-samples.git
git clone https://github.com/orcaman/openglbk.git openglrb4
git clone https://github.com/openglsuperbible/sb7code.git openglsb7
git clone https://github.com/capnramses/antons_opengl_tutorials_book.git
git clone https://github.com/glfw/glfw.git
git clone https://github.com/KhronosGroup/VK-GL-CTS.git

wget http://openglsuperbible.com/files/superbible7-media.zip && unzip superbible7-media.zip -d openglsb7/bin/media/
cd openglsb7/; git apply ../sb7code.patch; cd ../
