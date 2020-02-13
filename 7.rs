use std::convert::TryInto;
const PRE_PRIMES: [u64; 20] = [
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
];

fn main() {
  if let Some(result) = get_n_prime(10001) {
    println!("Result: {}", result)
  } else {
    panic!("unknown error")
  }
}

fn is_prime<'a>(x: u64, v: impl Iterator<Item = &'a u64>) -> Option<u64> {
  let threshold: u64 = f64::sqrt(x as f64) as u64;
  for i in v {
    if i > &threshold {
      break;
    } else {
      if (x % i) == 0 {
        return None;
      }
    }
  }
  Some(x)
}

fn get_n_prime<'a>(mut n: u64) -> Option<u64> {
  let mut pre_primes = PRE_PRIMES.to_vec();
  if n == 0 {
    panic!("not valid index, start from 1")
  } else if n <= 20 {
    let us: usize = n.try_into().unwrap();
    Some(pre_primes[us - 1])
  } else {
    // mpi - maybe_prime iterator
    let mut mpi = MaybePrime::new();
    n -= 20;
    loop {
      getting_n_prime(&mut n, &mut pre_primes, &mut mpi);
      if n == 0 {
        return Some(mpi.current);
      } else {
        continue;
      }
    }
  }
}

fn getting_n_prime<'a>(n: &mut u64, primes: &mut Vec<u64>, mpi: &mut MaybePrime) {
  if let Some(next) = mpi.next() {
    if let Some(prime) = is_prime(next, primes.iter()) {
      primes.push(prime);
      *n -= 1;
    }
  }
}

#[derive(Copy, Clone, Debug)]
enum MaybePrimeStep {
  Two = 2,
  Four = 4,
}

#[derive(Copy, Clone, Debug)]
struct MaybePrime {
  current: u64,
  step: MaybePrimeStep,
}

impl MaybePrime {
  fn new() -> MaybePrime {
    MaybePrime {
      current: 71,
      step: MaybePrimeStep::Two,
    }
  }
}

impl Iterator for MaybePrime {
  type Item = u64;

  fn next(&mut self) -> Option<u64> {
    match self.step {
      MaybePrimeStep::Two => {
        self.current += 2;
        self.step = MaybePrimeStep::Four;
        Some(self.current)
      }
      MaybePrimeStep::Four => {
        self.current += 4;
        self.step = MaybePrimeStep::Two;
        Some(self.current)
      }
    }
  }
}

#[test]
fn get_n_prime_test() {
  assert_eq!(get_n_prime(6), Some(13));
  assert_eq!(get_n_prime(21), Some(73));
  assert_eq!(get_n_prime(23), Some(83));
  assert_eq!(get_n_prime(200), Some(1223));
}
