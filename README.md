# Serverless domain redirector

This is an easy-to-configure URL rewrite service that
helps you redirect requests easily from one address to another.

You can deploy this to [Cloud Run](https://cloud.run) as
serverless (pay per request with a generous [free tier])
by clicking below:

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)

## Setup

To redirect a domain you own like `http://foo.com/` to
`https://bar.com/` with this:

1. deploy this (click above) and specify the target domain while deploying.
2. create a [domain mapping on Cloud Run][dm] to map your `foo.com` to this app.
3. update your domain's (`foo.com`) DNS records to hostnames provided by Cloud
   Run in the previous step.

Please **★Star** if you are using this!

If you want to customize, please feel free to **fork this repo** and customize
with your needs (you can click the "Run on Google Cloud" button from your
repository, too)!

---

_This is not an official Google project. See [LICENSE](./LICENSE)_

[free tier]: https://cloud.google.com/run/pricing
[dm]: https://cloud.google.com/run/docs/mapping-custom-domains
