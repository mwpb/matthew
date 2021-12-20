+++
title="Same-site cookies"
date=2021-02-06
template="even/templates/page.html"
[taxonomies]
categories=["coding"]
+++

If you would like to see a demonstration of the main point of this post then please see [https://github.com/mwpb/web-attacks](https://github.com/mwpb/web-attacks) and navigate to the /csrf/ folder.
In that repository there are instructions about how to set up a some docker containers to demonstrate the various attacks.

## Definitions

*Origin:* Two URLs have the same origin if and only if they have the same scheme, host-name and port.

*Site:* The host's most specific public suffix AND the next specifier.
This is sometimes written as eTLD+1 which stands for Effective Top-Level Domain plus one.

The definition of public suffix is made in the [public suffix list](https://publicsuffix.org/list/) and may change.
For more information (including the definition of 'schemeful same-site') please [https://web.dev/same-site-same-origin/](https://web.dev/same-site-same-origin).

The 'SameSite' cookie indeed concerns itself with sites and not origins.

## Examples

https://www.example.org has .org as the most specific public suffix.
Therefore the site is example.org.

https://mwpb.github.io has github.io as the most specific public suffix.
Therefore mwpb.github.io is the site.

## Same-site and cross-site requests

*Same-site:*

https://foo.example.com to https://bar.example.com

https://foo.bar.example.com to https://bar.example.com

*Cross-site:*

https://foo.com to https://bar.com

https://foo.github.io to https://bar.github.io

## Consequences

If a subdomain on the same site is compromised then cookies set by one will be sent to the other.

So strictly speaking cross-site request forgery (CSRF) is ruled out by setting SameSite=strict.
However a similar attack may still be perpetrated by URLs on the same site but which are not under your control.
This makes CSRF a confusing name because the same style of attack may still occur on the same site.

So the SameSite=strict cookies will still be sent.
For the purposes of defence in depth in case a subdomain gets compromised:
it is a good idea to use another strategy in addition to SameSite cookies.
If you only support clients using modern browsers then you can check the Origin header on the server-side.
Otherwise using CSRF tokens might be appropriate.
