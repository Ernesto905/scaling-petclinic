import http from 'k6/http';
export const options = {
  scenarios: {
    one_rps: {
      executor: 'constant-arrival-rate',
      duration: '60s',
      preAllocatedVUs: 1,
      rate: 1,
      timeUnit: '1s'
    },
  },
};
export default function () {
  const data = {
    firstName: 'ernie',
    lastName: 'bobo',
    address: '123',
    city: '123',
    telephone: '1231231234'
  }
  const header = {"Content-Type": "application/x-www-form-urlencoded"}
  http.get('http://petclinic:80');
  http.post('http://petclinic:80/owners/new', data, {headers: header})
}



