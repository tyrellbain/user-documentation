namespace Hack\Attributes\Memoize\ExceptionIsNotMemoized;

class CountThrows {
  private int $count = -1;
  <<__Memoize>>
  public function doStuff(): void {
    $this->count += 1;
    throw new \Exception('Hello '.$this->count);
  }
}

<<__EntryPoint>>
function main(): void {
  $x = new CountThrows();
  for($i = 0; $i < 2; ++$i) {
    try {
      $x->doStuff();
    } catch (\Exception $e) {
      \var_dump($e->getMessage());
    }
  }
}
