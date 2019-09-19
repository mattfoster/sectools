FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get install -y nmap openssl curl sqlmap dnsutils whois mitmproxy nikto zsh openssh-server

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
