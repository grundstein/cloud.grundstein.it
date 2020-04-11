import { is } from '@magic/test'

import hosts,{ gps, grs, gul, ghs, gbs, repos } from '../src/index.mjs'

export default [
  { fn: is.object(hosts), info: 'hosts is an object' },
  { fn: is.array(hosts.repos), info: 'host.repos is an array' },
  { fn: is.deep.equal(hosts.gps, gps), info: 'host.gps and gps are equal' },
  { fn: is.deep.equal(hosts.grs, grs), info: 'host.grs and grs are equal' },
  { fn: is.deep.equal(hosts.gul, gul), info: 'host.gul and gul are equal' },
  { fn: is.deep.equal(hosts.ghs, ghs), info: 'host.ghs and ghs are equal' },
  { fn: is.deep.equal(hosts.gbs, gbs), info: 'host.gbs and gbs are equal' },
  { fn: is.deep.equal(hosts.repos, repos), info: 'host.repos and repos are equal' },
  { fn: is.empty(repos), expect: false, info: 'repos is not empty' },
]
