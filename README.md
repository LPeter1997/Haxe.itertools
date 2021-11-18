## Itertools

[The Haxelib package can be found here.](https://lib.haxe.org/p/itertools/)

Many languages have a fluent API that helps working with sequences and sequence manipulation:
C# has [LINQ](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/),
Java has [Stream](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html),
Rust has [std::iter::Iterator](https://doc.rust-lang.org/std/iter/trait.Iterator.html),
C++ has [Ranges](https://en.cppreference.com/w/cpp/ranges) and so on.

These APIs allow us to express complex transformations in a compact and declarative
manner. Haxe has the [Lambda class](https://api.haxe.org/Lambda.html), which has a
couple of problems:

 * It is eagerly evaluated, the results are usually immediately collected into an `Array<T>`.
 This can be both wasteful, and constrasining, as it does not allow for potentially infinite sequences.

 * It lacks quite a few operations: There's no skipping, zipping, reversing, checking if a predicate
 is true for all/any elements, ...

 * The API is not fluent, as it works on `Iterable<T>`s instead of `Iterator<T>`s.

This library attempts to fill this hole in the Haxe ecosystem.

## Examples

[The full API documentation can be found here.](https://lpeter1997.github.io/Haxe.itertools/)

Collecting the names of students into a comma-separated string, who have have an average
over 4:
```hx
var names = students
    .filter(s -> s.average() > 4)
    .map(s -> s.name)
    .join(", ");
```

## Maturity

Please note, that the library is still early-stage. If you feel like something fundamental/useful
is missing, please open an issue!

## Provided functionality

[The full API documentation can be found here.](https://lpeter1997.github.io/Haxe.itertools/)

The library can be used through just 2 types: `Basic` and `Extensions`.
The `Basic` class contains functions that construct elemental iterators, like
a basic counter, or repeating an element infinitely. The `Extensions` class contains
extension functions for iterators, thus it is advised to use it with `using itertools.Extensions;`.

All operations (unless they reduce to a final result, like `all` or `count`) are lazy, meaning that they only perform computations, when they are iterated.

Contents of `Basic`:

 * `count(start = 0, step = 1)`: Creates an infinite `Int` counter iterable, starting from `start`, stepping `step` each time.

 * `repeat(element)`: Creates an infinite iterable, that repeats `element`.

 * `empty()`: Creates an empty iterable.

 * `one(element)`: Creates an iterable, that yields `element` once.

Contents of `Extensions`:

 * `asIterable(it)`: Casts `it` to an `Iterable<T>`. Useful for unambiguously referring to the extension functions when working with `Array<T>`s.

 * `asOnceIterable(it)`: Casts the `it` iterator to an `Iterable<T>` that can only be used once.

 * `toArray(it)`: Collects the elements of `it` into an `Array<T>`.

 * `toMap(it, keySel)`: Collects the elements of `it` into a `Map<K, V>`, using the keys that `keySel` selects from each element.

 * `toMapProj(it, keySel, valSel)`: Same as `toMap`, but the values are also selected with `valSel`.

 * `join(it, sep)`: Joins the elements of `it` with `sep` into a `String`, using `StringBuf.add`.

 * `first(it)`: Retrieves the first element of `it`.

 * `last(it)`: Retrieves the last element of `it`.

 * `nth(it, n)`: Retrieves the `n`th element of `it`.

 * `all(it, pred)`: Checks, if `pred` is true for all elements of `it`.

 * `any(it, pred)`: Checks, if `pred` is true for any element of `it`.

 * `count(it)`: Counts the number of elements in `it`.

 * `find(it, pred)`: Finds the first element in `it`, where `pred` is true.

 * `map(it, f)`: Transforms each element of `it` using `f`.

 * `filter(it, pred)`: Filters the elements of `it`, only keeping the elements where `pred` returns true.

 * `filterMap(it, f)`: Filters and transforms the elements of `it` using `f`. Only those elements are kept, where `f` returns `Some(x)`.

 * `enumerate(it)`: Appends the index to each element of `it` (making it `Indexed<T>`).

 * `zip(it1, it2)`: Pairs up each element of `it1` and `it2` into a `Pair<T, U>`.

 * `chain(it1, it2)`: Chains the start of `it2` to the end of `it1`.

 * `skip(it, n)`: Skips the first `n` elements of `it`.

 * `skipWhile(it, pred)`: Skips the first elements of `it`, as long as `pred` is true for them.

 * `take(it, n)`: Only keeps the first `n` elements of `it`.

 * `takeWhile(it, pred)`: Only keeps the first elements of `it`, as long as `pred` is true for them.

 * `scanl(it, seed, acc)`: Performs a step-by-step reduction, tarting with `seed`, and feeding the partial result and the next element of `it` into `acc`. Essentially a step-by-step `foldl`.

 * `foldl(it, seed, acc)`: Performs a fold left operation, starting with `seed`, feeding in the elements of `it` and the partial result into `acc`.

 * `flatten(it)`: Flattens an iterable of iterables into a flat element structure (`iterable<iterable<T>> -> iterable<T>`).

 * `flatMap(it, f)`: Transforms each element of `it` into a sequence, that are then flattened.

 * `reverse(it)`: Reverses the order of the elements of `it`.

 * `groupBy(it, keySel:T)`: Groups elements of `it`, selecting the group key with `keySel`.
