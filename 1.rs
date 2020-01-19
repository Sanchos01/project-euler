fn main() {
  let result: u32 = find_sum(1000);
  println!("Result: {:?}", result);
}

fn find_sum(limit: u32) -> u32 {
  (1..limit).filter(|&n| n % 3 == 0 || n % 5 == 0).sum()
}

#[test]
fn find_sum_test() {
  assert_eq!(find_sum(10), 23);
}
