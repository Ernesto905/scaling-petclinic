import http from 'k6/http';
export const options = {
  scenarios: {
    one_req_per_sec: {
      executor: 'constant-arrival-rate',
      duration: '60s',
      vus: 1,
      rate: 1,
      timeUnit: '1s',
      exec: 'req_per_sec',
    },
    one_read_per_sec: {
      executor: 'constant-arrival-rate',
      duration: '60s',
      vus: 1,
      rate: 1,
      timeUnit: '1s',
      startTime: '60s',
      exec: 'read_per_sec',
    },
    one_write_per_sec: {
      executor: 'constant-arrival-rate',
      duration: '60s',
      vus: 1,
      rate: 1,
      timeUnit: '1s',
      startTime: '120s',
      exec: 'write_per_sec',
    },
  },
};
export function req_per_sec() {
  http.get('http://petclinic:80');
}
export function read_per_sec() {
  http.get("http://petclinic:80/owners/1")
}
export function write_per_sec() {
  const data = {
    firstName: 'myFirst',
    lastName: 'myLast',
    address: '123',
    city: '123',
    telephone: '1231231234'
  }
  const header = {"Content-Type": "application/x-www-form-urlencoded"}
  http.post('http://petclinic:80/owners/new', data, {headers: header})
}
