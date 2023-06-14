export EDITOR='nvim'
export LC_ALL=en_US.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export LIBGL_DRI3_DISABLE=1
#export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
#export JAVA_HOME=/opt/android-studio-canary/jbr/release
#export LD_LIBRARY_PATH=/usr/lib/jvm/java-17-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
# export AWT_TOOLKIT=MToolkit
export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dorg.gradle.caching=true -Dorg.gradle.daemon=true -Dorg.gradle.parallel=true -Dorg.gradle.workers.max=4 -Dorg.gradle.configureondemand=true -Duser.country=US -Duser.language=en"
#export STUDIO_JDK=/usr/lib/jvm/java-17-openjdk
export STUDIO_VM_OPTIONS=/home/fh/AndroidEnv/cache/back/as.vmoptions
export STUDIO_PROPERTIES=/home/fh/AndroidEnv/cache/back/as.properties 
export IDEA_JDK=/usr/lib/jvm/java-17-openjdk
# IDEA_JDK
export QT_QPA_PLATFORM=xcb
export COGL_ATLAS_DEFAULT_BLIT_MODE=framebuffer

export GNOME_KEYRING_CONTROL=$(ls -d /run/user/$(id -u)/keyring/control)
