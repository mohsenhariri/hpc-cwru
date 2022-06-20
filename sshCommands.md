# Setup SSH connection

There are 4 kinds of ssh keys:

1. DSA
2. RSA
3. ECDSA
4. Ed25519

The best and most recent one is Ed25519.

### Generate private and public pair key

```
    ssh-keygen -o -a int_num -t ed25519 -f ~/path/to/save/keyName -C "your@email.com"
```

For example:

```
    ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_hpc_ed25519 -C "mxh1029@case.edu"
```

After that we should have a pair key in ~/.ssh

- private key "id_hpc_ed25519"
- public key "id_hpc_ed25519.pub"

### Test ssh-agent is running

```
eval "$(ssh-agent -s)
```

### Add new key to SSH agent

```
ssh-add ~/.ssh/id_hpc_ed25519
```

### Copy public key to a remote machine

```
ssh-copy-id -p 22 -i ~/.ssh/id_hpc_ed25519.pub yourCaseID@rider.case.edu
```

or just copy the key:

```
cat ~/.ssh/id_hpc_ed25519.pub
```

and past it into a remote machine in  <code>  ~/.ssh/authorized_keys </code>.

### Some useful ssh commands

Lists fingerprints of all identities currently represented by the agent.

```
ssh-add -l
```

Lists public key parameters of all identities currently represented by the agent.

```
ssh-add -L
```

Deletes all identities from the agent.

```
ssh-add -D
```
