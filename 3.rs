fn main() {
  let result: u64 = largest_prime_factor(600851475143);
  println!("Result: {:?}", result);
}

fn largest_prime_factor(number: u64) -> u64 {
  // using set of prime numbers will be more effective
  find_largest(number, 2)
}

fn find_largest(number: u64, prime: u64) -> u64 {
  if number % prime == 0 {
    find_largest(cut_prime(number, prime), prime + 1)
  } else if prime * prime >= number {
    number
  } else {
    find_largest(number, prime + 1)
  }
}

fn cut_prime(a: u64, b: u64) -> u64 {
  if a % b == 0 {
    cut_prime(a / b, b)
  } else {
    a
  }
}

#[test]
fn test_p2() {
  assert_eq!(largest_prime_factor(13195), 29);
}
