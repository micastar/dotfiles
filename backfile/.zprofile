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
# https://wiki.archlinux.org/title/Intel_graphics#Font_and_screen_corruption_in_GTK_applications_(missing_glyphs_after_suspend/resume)
export COGL_ATLAS_DEFAULT_BLIT_MODE=framebuffer

#export GNOME_KEYRING_CONTROL=$(ls -d /run/user/$(id -u)/keyring/control)

# https://wiki.archlinux.org/title/Xdg-utils
# https://wiki.archlinux.org/title/XDG_Desktop_Portal
export XDG_CURRENT_DESKTOP=XFCE
