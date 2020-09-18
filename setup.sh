# Set up APT and install packages
sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt update
apt install -y build-essential gcc g++ wget git vim nano cmake python3 flex bison

# Timezone
echo "Asia/Chongqing" > /etc/timezone
rm -f /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Set up PATH
cat >> /root/.bashrc <<EOF
export PATH=/llvm/bin:$PATH
EOF
