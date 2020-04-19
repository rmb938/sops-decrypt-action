# sops-decrypt-action
Github Action to decrypt [mozilla/sops](https://github.com/mozilla/sops) encrypted secrets.

## Inputs

### `secrets-directory`

**Required** The directory that contain sops encrypted secrets.

This directory is relative to the `GITHUB_WORKSPACE`

The directory must contain the following file structure:

```shell script
secrets/
  decrypted/
  encrypted/
    some-secret.json
```

## Example Usage

```yaml
uses: rmb938/sops-decrypt-action@master
with:
  secrets-directory: secrets
```

After decryption the secrets directory will look like the following:

```shell script
secrets/
  decrypted/
    some-secret.json
  encrypted/
    some-secret.json
```
