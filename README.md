
# IETF-DOCS

## IETF documentation fetcher, cacher, viewer.

This package adds an interactive function `ietf-docs-open-at-point`
which can be bound to a key. When the function is invoked it will look
at the text around the point and if it is an ietf document name (e.g.,
RFC-791, RFC 2992, draft-ietf-isis-ipv6, ...) it will then fetch the
file (if it has not done so already), and load it into a new buffer.

A useful binding might be `C-c i o`:


```
(global-set-key (kbd "C-c i o") 'ietf-docs-open-at-point)

```

There are a couple customizable variables, the most import of which is
`ietf-docs-cache-directory`. This is where the fetched documents will
be cached and loaded from. The default value is `~/ietf-docs-cache`.
