#!/bin/bash
#

CURRENT_DIR="$(cd "$(dirname "$0")";pwd)"
NVIM_HOME="${HOME}/.config/nvim"
NVIM_CONF_FILE="${NVIM_HOME}/init.vim"
NVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage"
VERSION=v14.16.1
DISTRO=linux-x64
NODE_DOWNLOAD_URL="https://nodejs.org/dist/v14.16.1/node-v14.16.1-linux-x64.tar.xz"


##### 安装 Vim-Plug #######
help(){
    echo -e "\e[31mError!!!!\e[0m"
    echo -e "Usage: \e[32mbash $0 <install|deploy|update>\e[0m"
    exit 1
}

# 安装
install(){

    # 判断操作系统的版本
    if ! [ -x "$(which lsb_release)" ];then
        echo "请事先安装好 lsb_release 命令..."
        exit 1
    fi

    curl -fLo ~/.config/nvim/autoload/plug.vim \
      --create-dirs https://raw.fastgit.org/junegunn/vim-plug/master/plug.vim

    distribution="$(lsb_release -i | awk -F "[:\t ]+" '{print $NF}')"

    if [ ${distribution} == "CentOS" ];then
        echo "检测到系统是 CentOS, 开始安装依赖..."
        sudo yum -y install python3 python3-devel ctags wget

        # lazygit
        /bin/cp -f ${CURRENT_DIR}/repo/atim-lazygit-epel-7.repo /etc/yum.repos.d/ 
        sudo yum install -y lazygit

        # rg 
        /bin/cp -f ${CURRENT_DIR}/repo/atim-lazygit-epel-7.repo /etc/yum.repos.d/
        sudo yum install -y ripgrep

    elif [ ${distribution} == "Debian" ];then
        echo "检测到系统是 Debian, 开始安装依赖..."
        sudo apt-get update 
        sudo apt-get install python3 python3-dev python3-pip wget
        sudo apt-get install lazygit
        sudo apt-get install ripgrep universal-ctags exuberant-ctags
    else
        echo "不支持的操作系统"
        exit 2
    fi

    python3 -m pip install ranger-fm
    # ranger 
    git clone https://hub.fastgit.org/ranger/ranger.git
    cd ranger && sudo make install

    # fzf
    git clone --depth 1 https://hub.fastgit.org/junegunn/fzf.git ~/.fzf
    sed -i 's@github.com@hub.fastgit.org@g' ~/.fzf/install
    ~/.fzf/install

    cd ${CURRENT_DIR}
    if ! [ -x nvim.appimage ];then
        wget ${NVIM_DOWNLOAD_URL}
        if [ $? -ne 0 ];then
            ls nvim.appimage | xargs rm
            exit
        fi
    fi

    chmod u+x nvim.appimage && {
        ./nvim.appimage --appimage-extract
        ./squashfs-root/AppRun --version
        sudo mv squashfs-root / && sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    }

    wget ${NODE_DOWNLOAD_URL}
    sudo mkdir -p /usr/local/lib/nodejs
    sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
    
    
    echo "VERSION=${VERSION}" >>  ~/.bashrc
    echo "DISTRO=${DISTRO}" >> ~/.bashrc
    echo "export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH" >> ~/.bashrc
    source ~/.bashrc

    sudo ln -s /usr/local/lib/nodejs/node-v14.16.1-linux-x64/bin/node /usr/bin/node
    sudo ln -s /usr/local/lib/nodejs/node-v14.16.1-linux-x64/bin/npm /usr/bin/npm



    
    sudo python3 -m pip install neovim
    sudo python3 -m pip install jedi
    echo -e "Please Run \e[32msource ~/.bashrc\e[0m"
    echo -e "Please Run \e[32mnpm install neovim -g\e[0m"

}


# 配置 vim
deploy(){
    
    # 安装 Plugin 插件
    curl -fLo ~/.config/nvim/autoload/plug.vim \
      --create-dirs https://raw.fastgit.org/junegunn/vim-plug/master/plug.vim

    # 复制插件目录
    /bin/cp -rf ${CURRENT_DIR}/init/init.vim  ${NVIM_CONF_FILE}
    /bin/cp -rf ${CURRENT_DIR}/configs/* ${NVIM_HOME}/
    /bin/cp -rf ${CURRENT_DIR}/init/tasks.ini ${NVIM_HOME}/tasks.ini 

  
    # 自动安装插件
    nvim +PlugInstall +qall
    /bin/cp -rf ${CURRENT_DIR}/init/init.vim.conf  ${NVIM_CONF_FILE}
    
   
}


# 更新查看
update(){
   
    nvim +PlugUpdate +qall
}

main(){
    
    if [ $# -ne 1 ];then
        help
    fi

    if [ "$1" == "install" ];then
        install
    elif [ "$1" == "deploy" ];then
        deploy
    elif [ "$1" == "update" ];then
        update
    elif [ "$1" == "upgrade" ];then
        upgrade
    else 
        help
    fi
}

main "$@"
