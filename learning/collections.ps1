# Multiply collection types amalgamated into one hashtable

$h = @{
list = [System.Collections.Generic.List[object]]@()
}
$h.strcol = [System.Collections.Specialized.StringCollection]::new()
$h.dict = [System.Collections.Specialized.OrderedDictionary]([System.StringComparer]::OrdinalIgnoreCase)
