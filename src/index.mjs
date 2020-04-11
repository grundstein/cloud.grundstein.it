export const gps = { host: '127.0.0.1', port: 5230, name: 'grundstein positioning service' }
export const grs = { host: '127.0.0.1', port: 5231, name: 'grundstein redirection service' }
export const gul = { host: '127.0.0.1', port: 5232, name: 'grundstein universal logger' }
export const ghs = { host: '127.0.0.1', port: 5233, name: 'grundstein health checker' }
export const gbs = { host: '127.0.0.1', port: 5234, name: 'grundstein build service' }

export const gms = { host: '127.0.0.1', port: 2350, name: 'grundstein magic page server' }
export const gas = { host: '127.0.0.1', port: 2351, name: 'grundstein api server' }

export const repos = [
  {
    host: 'github.com',
    org: 'grundstein',
    repo: 'dev.grundstein.it',
    branch: 'master',
  },
]

export default {
  gps,
  grs,
  gul,
  ghs,
  gbs,
  repos,
}
