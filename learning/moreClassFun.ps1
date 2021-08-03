class FunWithInts
    {
    [int[]]$Ints = 0..10

    [int[]]GetOddIntegers(){
    return $this.Ints.Where({ ($_ % 2) })
    }

    [void] GetEvenIntegers(){
    $this.Integers.Where({ ($_ % 2) -eq 0})
    }
    [string]SayHello(){
    "good morn"

    return "hello world"
    }
}

# Then instanciate the class 

$mything = [FunWithInts]::new()

$mything.SayHello()
