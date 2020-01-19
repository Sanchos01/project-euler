fn main() {
  let result: u32 = fibonacci_even_sum(4000000);
  println!("Result: {:?}", result);
}

fn fibonacci_even_sum(limit: u32) -> u32 {
  let mut current: u32 = 1;
  let mut next: u32 = 2;
  let mut result: u32 = 0;
  while current < limit {
    if current % 2 == 0 {
      result = result + current;
    }
    let buffer: u32 = next;
    next = next + current;
    current = buffer;
  }
  result
}

#[test]
fn test_p2() {
  assert_eq!(fibonacci_even_sum(90), 44);
}
