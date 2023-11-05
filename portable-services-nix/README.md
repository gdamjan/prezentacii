## Systemd Portable Services with <b style="color:red">Nix</b>

---
## @gdamjan

Дамјан Георгиевски

Слободен Софтвер Македонија

Hacklab Kika Скопје

Note:
вовед, кој сум шо сум, хаклаб КИКА
тоа е мојот nick на github, twitter, facebook, irc, matrix…
25 years Linux user, want to make stupid things, like learn Nix

---
## Nix

A programming language

(pure, functional, immutable, lazy)

Note:
it's a normal language, you know: numbers, strings, booleans, lists, attribute-sets (dicts)
The only difference: paths, derivations

⌄⌄⌄

```nix
b = true && false # boolean

n = 1 + 2 # numbers (integers, floats are separate types)

s = "Hello" + " " + "World ${n}" # concat and templating

l = [ 1 2 3 "x" ] # lists

attrset = { key1="value1";  key2="value2"; } # like dict

f = x: x*x # functions
f 4 # call function
```
⌄⌄⌄

Some special types:
- path
- derivation

⌄⌄⌄
Haskel for children

---
## Nixpkgs

The standard library for Nix (built with Nix)

Hermetically builds reproducible software and distros (images)

Note:
basically you write a function or two, and you get a Linux distro with some sofware its dependencies and configuration. All software is hermetically built in sandbox, reproducible, etc..

Ok cool, so what can we make with that is Docker Images or full distros, but… I hate docker

---
## Portable Services in Systemd ❤️

1) Image of your software + all dependencies
2) Native Systemd service

Note:
- I love systemd
- images, encapsulating all your software solve a problem
- systemd has a better runtime (than docker)

---
<img data-src="nixpkgs-pr.png">

Note:
so I decided to use my newly found Nix powers and contribute

---
<!-- .slide: data-background-iframe="https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-portableService" data-preload -->

---
## Demo

⌄⌄⌄
<img data-src="demo-project-nextcloud-release.png">

⌄⌄⌄

```
sudo wget -P /var/lib/portables/ \
  github.com/gdamjan/nextcloud-service/…/nextcloud_27.1.2.raw

portablectl list

sudo portablectl attach --enable --now nextcloud_27.1.2
```

⌄⌄⌄

[![asciicast](https://asciinema.org/a/ZnyefcSbwbz1dbEo9scCD9XdG.png)](https://asciinema.org/a/ZnyefcSbwbz1dbEo9scCD9XdG?autoplay=1)

⌄⌄⌄
<img data-src="nextcloud-installed.png">

---
## References

* https://systemd.io/PORTABLE_SERVICES/
* https://0pointer.net/blog/walkthrough-for-portable-services-in-go.html
* https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-portableService
* https://github.com/NixOS/nixpkgs/pull/161278
* https://github.com/gdamjan/nextcloud-service/

---
## Q&A

(Няма време)
<br/>
<br/>

#### @gdamjan

<small>
Дамјан Георгиевски

Слободен Софтвер Македонија, Hacklab Kika Скопје
</small>

Note:
The moral of the story is: Yes You Can!
