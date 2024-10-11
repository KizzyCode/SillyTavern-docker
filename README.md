# kizzycode/sillytavern

An small, *rootless* [SillyTavern](https://github.com/SillyTavern/SillyTavern) container.

### Container users and mountpoints
Container users may interact with the external environment via mountpoints:
- `sillytavern`: A system user for the server; it has UID `10000`

### Custom certificates
To talk with LLM API-backends that use custom (e.g. self-signed) certificates, set the `NODE_EXTRA_CA_CERTS` environment
variable to a file path containing your certificate.
