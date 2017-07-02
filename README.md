# Who DDoSed Me

Is a simple tool for analyzing system logs.

# Installation

Please download precompiled script or build from sources (make build).

# Usage

Please pipe files to scan into STDIN and specify `--adapter`. Currently only supported adapter is `sshlogin`.

## Example

```
echo logs.txt | ./who_ddosed_me --async true --adapter sshlogin > out
```

It will analyze `logs.txt` and output data into out file.
