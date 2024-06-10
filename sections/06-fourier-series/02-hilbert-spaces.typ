#import "../../utils/core.typ": *

== Гильбертовы пространства

#remind(name: "Скалярное произведение")[
  Если $X$ --- векторное пространство, то $dotp(dot, dot): X times X --> CC$ --- скалярное произведение, если
  1. $dotp(x, x) >= 0$, $dotp(x, x) = 0 <==> x = arrow(0)$
  2. $dotp(x, y) = cj(dotp(y, x))$
  3. $dotp(x + y, z) = dotp(x, z) + dotp(y, z)$
  4. $dotp(alpha x, y) = alpha dotp(x, y)$
  Следовательно,
  - $dotp(x, y + z) = dotp(x, y) + dotp(x, z)$.
  - $dotp(x, alpha y) = cj(alpha) dotp(x, y)$
]

#def[
  $H$ называется _Гильбертовым пространством_, если в $H$ есть скалярное произведение, и $H$ --- полное (то есть сходимость в нем равносильна фундаментальности).
]

#examples[
  + $RR^d$, $dotp(x, y) = sum_(k=1)^d x_k cj(y_k)$,
  + $CC^d$, $dotp(x, y) = sum_(k=1)^d x_k cj(y_k)$,
  + $l^2$: $dotp(x, y) = sum_(k=1)^oo x_k cj(y_k)$,
  + $L^2 (E mu)$: $dotp(x, y) = integral_E f cj(g) dif mu$.
]

#lemma[
  Если ряд $sum_(n=1)^oo x_n$ сходится, то 
  $
    dotp(sum_(n=1)^oo x_n, y) = sum_(n=1)^oo dotp(x_n, y).
  $
]

#proof[
  Рассмотрим $S_n := sum_(k=1)^n x_k --> S := sum_(k=1)^oo x_k$. Тогда
  $
    dotp(S, y) <-- dotp(S_n, y) = dotp(sum_(k=1)^n x_k, y) = sum_(k=1)^n dotp(x_k, y) --> sum_(k=1)^oo dotp(x_k, y)
  $
]

#def[
  Векторы $x$ и $y$ _ортогональны_, если их скалярное произведение 0. Обозначается $x perp y$.

  Ряд $sum_(n=1)^oo x_n$ назовем _ортогональным_, если $dotp(x_k, x_n) = 0$ для всех $n != k$.
]

#th[
  Пусть $H$ --- гильбертово пространсво, $sum_(n=1)^oo x_n$ --- ортогональный ряд в $H$. Тогда этот ряд сходится тогда и только тогда, когда числовой ряд $sum_(n=1)^oo norm(x_n)^2$ сходится. В этом случае, $norm(sum_(n=1)^oo x_n)^2 = sum_(n=1)^oo norm(x_n)^2$.
]

#proof[
  Пусть $S_n := sum_(k=1)^n x_k$, $C_n := sum_(k=1)^n norm(x_k)^2$.
  $
    sum_(n=1)^oo x_n "сходится" <==> S_n "сходится" <==> S_n "фундаментальна" newline(<==>)
    forall eps > 0 space exists N space forall n, m >= N space norm(S_n - S_m) < eps.
  $
  Оценим квадрат нормы разности:
  $
    norm(S_n - S_m)^2 = norm(sum_(k = m+1)^n x_k)^2 = dotp(sum_(k=m+1)^n x_k, sum_(j=m+1)^n x_j) newline(=) sum_(j,k=m+1)^n underbrace(dotp(x_k, x_j), 0 "если" k != k) = sum_(k = m+1)^n norm(x_k)^2 = C_n - C_m.
  $
  Получается, $S_n$ фундаментальна тогда и только тогда, когда $C_n$ фундаментальна. Это как раз равносильно тому, что $S_n$ сходится тогда и только тогда, когда $C_n$ сходится. Более того,
  $
    norm(sum_(n=1)^oo x_n)^2 = dotp(sum_(n=1)^oo x_n, sum_(k=1)^oo x_k) = sum_(n=1)^oo sum_(k=1)^oo underbrace(dotp(x_n, x_k), 0 "если" n != k) = sum_(n=1)^oo norm(x_n)^2.
  $
]

#follow[
  Если ортогональный $sum_(n=1)^oo x_n$ сходится, $phi: NN --> NN$ --- перестановка, то $sum_(n=1)^oo x_(phi(n))$ --- сходится к той же сумме.
]

#proof[
  Сходимость понятна:
  $
    sum_(n=1)^oo x_n "сходится" <==> sum_(n=1)^oo norm(x_n)^2 "сходится" <==> sum_(n=1)^oo norm(x_(phi(n)))^2 "сходится" <==> sum_(n=1)^oo x_(phi(n)) "сходится".
  $
  Найдем предел:
  $
    text(size: #0.85em,
      norm(sum_(n=1)^oo x_n - sum_(n=1)^oo x_(phi(n)))^2 =
      norm(sum_(n=1)^oo (x_n - x_(phi(n))))^2 =
      dotp(sum_(n=1)^oo (x_n - x_(phi(n))), sum_(k=1)^oo (x_k - x_(phi(k)))) newline(=)
      sum_(n=1)^oo sum_(k=1)^oo dotp(x_n - x_(phi(n)), x_k - x_(phi(k))) =
        sum_(k,n)^oo underbrace(dotp(x_n, x_k), 0 "если" k != n) -
        sum_(k,n=1)^oo underbrace(dotp(x_(phi(n)), x_k), 0 "если" k != phi(n)) -
        sum_(k,n=1)^oo underbrace(dotp(x_n, x_(phi(n))), 0 "если" n != phi(k)) +
        sum_(k,n=1)^oo underbrace(dotp(x_phi(n), x_(phi(k))), 0 "если" n != k)
      newline(=)
        sum_(n=1)^oo norm(x_n)^2
        - cancel(sum_(n=1)^oo norm(x_(phi(n)))^2)
        - sum_(k=1)^oo norm(x_(phi(k)))^2
        + cancel(sum_(n=1)^oo norm(x_(phi(n)))^2)
      = 0.
    )
  $
]

#def[
  $x_1$, $x_2$, $x_3$, ... --- _ортогональная система_, если $norm(x_k) != 0$ и $dotp(x_k, x_n) = 0$ для всех $k != n$.
]

#def[
  $x_1$, $x_2$, $x_3$, ... --- _ортонормированная система_, если $norm(x_k) = 1$ и $x_k perp x_n$ для всех $k != n$.
]

#notice[
  Ортогональная система линейно независима:
  Пусть
  $
    sum_(k=1)^n c_k x_k = 0.
  $
  Тогда
  $
    0 = dotp(sum_(k=1)^n c_k x_k, x_j) = sum_(k=1)^n c_k underbrace(dotp(x_k, x_j), 0 "если" k != j) = c_j norm(x_j)^2 ==> c_j = 0.
  $
]

#examples(name: "ортогональных систем")[
  1. $e_n = (0, 0, ..., 0, 1, 0, 0, ...)$ --- орты в $l^2$ --- ортонормированная система в $l^2$.
  2. $1$, $cos t$, $sin t$, $cos 2t$, $sin 2t$, ... --- ортогональная система в#footnote[по умолчанию считаем, что пространство Лебега построено по мере Лебега] $L^2 [0, 2pi]$.
  3. $e^(i t n)$, $n in ZZ$ --- ортогональная система в $L^2 [0, 2pi]$:
    $
      dotp(e^(i n t), e^(i m t)) = integral_0^(2pi) e^(i n t) dot cj(e^(i m t)) dif t = integral_0^(2pi) e^(i (n - m) t) dif t = cases(2pi "при" n = m, 0 "иначе").
    $
  4. $1$, $cos t$, $cos 2t$, $cos 3t$, ... --- ортогональная система в $L^2 [0, pi]$.
  5. $sin t$, $sin 2t$, $sin 3t$, ... --- ортогональная система в $L^2 [0, pi]$.
]

#th[
  $e_1$, $e_2$, ... --- ортогональная система в гильбертовом пространстве $H$, $x = sum_(n=1)^oo c_n e_n$. Тогда $ c_n = dotp(x, e^n)/norm(e_n)^2. $
]

#proof[
  $
    dotp(x, e_n) = dotp(sum_(k=1)^oo c_k e_k, e_n) = sum_(k=1)^oo c_k underbrace(dotp(e_k, e_n), 0 "если" k != n) = c_n dot dotp(e_n, e_n) = c_n norm(e_n)^2.
  $
]

#def[
  $e_1$, $e_2$, ... --- ортогональная система в гильбертовом пространстве $H$, $x in H$. Тогда
  $
    c_n (x) = dotp(x, e_n)/norm(e_n)^2
  $
  называется _коэффициентом Фурье_ вектора $x$ по системе $e_1$, $e_2$, ....
  
  Ряд $sum_(n=1)^oo c_n (x) e_n$ назовем _рядом Фурье_ для вектора $x$ по системе $e_1$, $e_2$, .... Мы пока ничего не знаем про его свойства, например про то, сходится ли он вообще.
]

#notice(plural: true)[
  1. Если $x = sum_(n=1)^oo c_n e_n$, то это его ряд Фурье.
  2. $n$-е слагаемое ряда Фурье --- проекция вектора $x$ на прямую натянутую на вектор $e_n$, то есть $x = c_n (x) e_n + z$, где $z perp e_n$. $z = x - c_n (x) e_n$, значит $dotp(z, e_n) = dotp(x, e_n) - c_n (x) dotp(e_n, e_n) = 0$.
]

#th(name: "свойства частичных сумм ряда Фурье")[
  Пусть $e_1$, $e_2$, ... --- ортогональная система, $x in H$, $S_n := sum_(k = 1)^n c_k (x) e_k$, $Ll_n := Lin {e_1, e_2, ..., e_n}$. Тогда
  1. $S_n$ --- ортогональная проекция $x$ на $Ll_n$, то есть $x = S_n + z$, где $z perp Ll_n$.
  2. $S_n$ --- наилучшее приближение к $x$ в $Ll_n$, то есть $norm(S_n - x) = min_(y in Ll_n) norm(y - x)$.
  3. $norm(S_n) <= norm(x)$.
]

#proof[
  1. $z = x - S_n$. Достаточно доказать, что $z perp e_k$ для всех $k = 1, ..., n$.
    $
      dotp(z, e_k) = dotp(x - sum_(j=1)^n c_j (x) e_j, e_k) = dotp(x, e_k) - sum_(j=1)^n c_j (x) underbrace(dotp(e_j, e_k), 0 "если" k != j) = dotp(x, e_k) - c_k (x) norm(e_k)^2.
    $
  2. $x - y = underbrace(S_n - y, in Ll_n) + underbrace(z, perp Ll_n)$. Значит это сумма двух ортогональных векторов, а тогда
    $
      norm(x - y)^2 = norm(S_n - y)^2 + norm(z)^2 >= norm(z)^2 = norm(x - S_n)^2
    $
    и равенство достигается при $S_n = y$. Значит это и правда минимум.

  3. $x = S_n + z$, $S_n in Ll_n$, $z perp Ll_n$. Тогда
    $
      norm(x)^2 = norm(z)^2 + norm(S_n)^2 >= norm(S_n)^2.
    $
]

#follow(name: "неравенство Бесселя")[
  $
    sum_(n = 1)^oo abs(c_n (x))^2 norm(e_n)^2 <= norm(x)^2.
  $
]

#proof[
  $
    norm(x)^2 >= norm(S_n)^2 = sum_(k=1)^n norm(c_k (x) e_k)^2 = sum_(k = 1)^n abs(c_k (x))^2 norm(e_k)^2
  $
  и устремляем $n$ в $oo$. 
]

#th(name: "Рисса-Фишера")[
  $H$ --- гильбертово пространство, $x in H$, $e_1$, $e_2$, $e_3$, ... --- ортогональная система в $H$. Тогда
  1. Ряд Фурье для $x$ сходится.
  2. $x = sum_(n = 1)^oo c_n (x) e_n + z$, где $z perp e_n$ для всех $e_n$.
  3. $x = sum_(n = 1)^oo c_n (x) e_n$ тогда и только тогда, когда $norm(x)^2 = sum_(n = 1)^oo abs(c_n (x))^2 norm(e_n)^2$.
  Третий пункт известен как тождество Парсеваля.
]

#proof[
  1. Знаем $sum_(n=1)^oo norm(c_n (x) e_n)^2 <= norm(x)^2$ (неравенство Бесселя), значит $sum_(n=1)^oo c_n (x) e_n$ --- сходится.
  2. $z = x - sum_(k = 1)^oo c_k (x) e_k$.
    $
      dotp(z, e_n) = dotp(x, e_n) - sum_(k=1)^oo c_k (x) underbrace(dotp(e_k, e_n), 0 "если" k != n) = dotp(x, e_n) - c_n (x) dotp(e_n, e_n) = 0.
    $
  3. $z perp sum_(k = 1)^oo c_k (x) e_k$, $0 = dotp(z, S_n) --> dotp(z, S)$. Значит
    $
      norm(x)^2 = norm(z)^2 + norm(sum_(k=1)^oo c_k (x) e_k)^2 = norm(z)^2 + sum_(k=1)^oo abs(c_k (x))^2 norm(e_k)^2.  
    $
]

#notice[
  1. $S = sum_(k=1)^oo c_k (x) e_k$ --- ортогональная проекция на $Cl Lin {e_1, e_2, ...}$.
  2. Если $sum_(k=1)^oo abs(c_k)^2 norm(e_k)^2 < +oo$, то найдется $x$ такой, что $sum_(k=1)^oo c_k e_k$ --- его ряд Фурье.
]

#def[
  $e_1$, $e_2$, ... --- ортогональная система в $H$.
  1. $e_1$, $e_2$, ... --- _базис_, если для любого $x in H$, $x = sum_(n=1)^oo c_n (x) e_n$.
  2. $e_1$, $e_2$, ... --- _полная система_, если $z perp e_n$ для любого $n$, тогда и только тогда, когда $z = 0$.
  3. $e_1$, $e_2$, ... --- _замкнутая система_, если для любого $x in H$, $norm(x)^2 = sum_(n=1)^oo abs(c_n (x))^2 norm(e_n)^2$.
]

#th[
  Следующие условия равносильны:
  1. $e_1$, $e_2$, ... --- базис.
  2. $forall x, y in H space dotp(x, y) = sum_(n=1)^oo c_n (x) cj(c_n (y)) norm(e_n)^2$.
  3. $e_1$, $e_2$, ... --- замкнутая система
  4. $e_1$, $e_2$, ... --- полная
  5. $Cl Lin {e_n} = H$.
]

#proof[
  - "$1==>2$": $dotp(x, y) = dotp(sum_(k = 1)^oo c_k (x) e_k, sum_(n=1)^oo c_n (y) e_n)$. Надо раскрыть скобки и все получится.
  - "$2==>3$": Берем $y = x$.
  - "$3==>4$": Пусть $z perp e_n$ для любого $n$. Тогда $c_n (z) = 0$ для любого $n$, и по тождеству Парсеваля $norm(z)^2 = sum_(n = 1)^oo abs(c_n (z))^2 norm(e_n)^2 = 0$.
  - "$4==>1$": $x = sum_(n=1)^oo c_n (x) e_n + z$, где $z perp e_n$ для любого $n$. Значит $z = 0$.
  - "$1==>5$": $x = sum_(n=1)^oo c_n (x) e_n <-- sum_(k = 1)^n c_k (x) e_k in Lin {e_n}$, значит любой $x$ лежит в замыкании, и $H subset Cl Lin {e_n}$.
  - "$5==>4$": $z perp e_n$ для любого $n$. Тогда $z perp Lin {e_n}$, значит $z perp Cl Lin {e_n} = H$, значит $z perp z$, значит $z = 0$.
]

#th(name: "ортогонализация Грама-Шмидта")[
  Пусть $H$ --- пространство со скалярным произведением, $x_1$, $x_2$, ... --- линейно независимая система векторов (не более чем счетная --- для конечных тоже работает). Тогда существует ортонормированная $e_1$, $e_2$, ... такая, что для любого $n$, $Lin {e_1, e_2, ..., e_n} = Lin {x_1, x_2, ..., x_n}$.
]

#proof[
  Доказательство конструктивное, поэтому вместе с ним прилагается конкретный способ такую систему построить. Такой процесс называется "_ортогонализацией Грама-Шмидта_".
  
  Понятно, что любую систему векторов можно нормировать, поэтому построим ортогональную, а потом исправим ее. Пусть $f_1 = x_1$. Дальше ищем $f_n = x_n - a_1 f_1 - a_2 f_2 - ...$. Тогда, так как это просто линейная комбинация,
  $ 
    Lin {f_1, f_2, ..., f_n} = Lin lr(size: #1.5em, {underbrace(f_1\, f_2\, ...\, f_(n - 1), Lin{x_1, x_2, ..., x_(n - 1)}), x_n}) = Lin {x_1, x_2, ..., x_(n - 1), x_n}.
  $
  Осталось подобрать коэффициенты, чтобы была ортогональность, то есть, чтобы для любого $k < n$:
  $
    0 = dotp(f_n, f_k) = dotp(x_n, f_k) - a_1 dotp(f_1, f_k) - ... - a_(n - 1) dotp(f_(n - 1), f_k) = dotp(x_n, f_k) - a_k dotp(f_k, f_k),
  $
  так как $dotp(f_i, f_k) = 0$ при $i != k$.

  Значит $a_k = dotp(x_n, f_k)/norm(f_k)^2$, то есть $a_k = c_k (x_n)$ --- коэффициенты Фурье. Дальше, говорим $e_n = f_n / norm(f_n)$. Надо только проверить, что $f_n != 0$. Ну, действительно, в этом случае
  $
    x_n = a_1 f_1 + ... + a_(n - 1) f_(n - 1) in Lin {f_1, ..., f_(n - 1)} = Lin {x_1, ..., x_(n - 1)}.
  $
]

#exercise[
  Если $tilde(e)_1$, $tilde(e)_2$, ... --- другая ортонормированная система с тем же свойством ($forall n space Lin {e_1, e_2, ..., e_n} = Lin {x_1, x_2, ..., x_n}$), то $tilde(e)_n = lambda_n e_n$, где $lambda_n in RR$ (или $CC$), и $abs(lambda_n) = 1$.
]

#def(name: "ортогональные многочлены")[
  Пусть $w: dotp(a, b) --> RR$ --- неотрицательная измеримая (здесь $dotp(a, b)$ --- любой промежуток). Пусть $mu A := integral_A w dif lambda_1$, $dotp(x, y) := integral_a^b x(t) cj(y(t)) w(t) dif lambda_1 (t)$. Тогда $L^2 ((a, b), mu)$ --- гильбертово. Предположим, что $w$ такая, что $integral_a^b t^n w(t) dif lambda_1 (t)$ абсолютно сходится при любом $n$, то есть $t^n in L^2 ((a, b), mu)$, то есть все мономы лежат в пространстве, а значит и все многочлены. Возьмем последовательность этих мономов ($t_0$, $t_1$, $t^2$, ...) и ортогонализируем Граммом-Шмидтом. Получается последовательность _ортогональных многочленов_ относительно скалярного произведения $dotp(dot, dot)$ с весом $w$.
]

#examples[
  1. $L^2 ([-1, 1], lambda_1)$: многочлены Лежандра:
    $
      P_n (t) := 1/(2^n n!) ((t^2 - 1)^n)^((n)).
    $
    Действительно,
    $
      dotp(P_n, P_k) =
      1/(2^n n!) dot 1/(2^k k!) integral_(-1)^1 ((t^2 - 1)^k)^((k)) ((t^2 - 1)^n)^((n)) dif t newline(=^"по частям")
      ... underbrace(lr(((t^2 - 1)^k)^((k)) ((t^2 - 1)^n)^((n - 1)) |)_(-1)^1, 0) - ... dot integral_(-1)^1 ((t^2 - 1)^k)^((k + 1)) ((t^2 - 1)^n)^((n - 1)) dif t newline(=) ... =^"много раз"_"по частям"
      ... dot integral_(-1)^1 underbrace(((t^2 - 1)^k)^((2k + 1)), 0) ((t^2 - 1)^2)^((n - k - 1)) dif t = 0.
    $
    Если постараться, можно проверить, что они нормированы.

  2. $L^2 ([-1, 1], (dif lambda_1)/sqrt(1 - t^2))$ ($w(t) = 1/sqrt(1 - t^2)$): многочлены Чебышева первого рода:
    $
      T_n (t) = cos (n arccos t).
    $
    Да, это многочлены (можно проверить по индукции). Они правда ортогональны:
    $
      dotp(T_k, T_n) =
      integral_(-1)^1 cos(k arccos t) cos(n arccos t) (dif t)/sqrt(1 - t^2) 
      =^(s = arccos t \ cos s = t \ dif t =
      -sin s dif s) integral_0^pi cos(k s) cos(n s) (sin s)/(sin s) dif s newline(=)
      1/2 integral_0^pi (cos((k + n) s) + cos((k - n) s)) dif s = 0.
    $

  3. $L^2 ([-1, 1], sqrt(1 - t^2) dif lambda_1)$: многочлены Чебышева второго рода:
    $
      U_n (t) = (sin ((n + 1) arccos t))/sqrt(1 - t^2).
    $
  
  4. $L^2 (RR, e^(-t^2) dif lambda_1)$: многочлены Эрмита:
    $
      H_n (t) = e^(t^2) (e^(-t^2))^((n)).
    $
  
  5. $L^2 ([0, +oo), e^(-t) dif lambda_1)$: многочлены Лагерра (ударение на "е"):
    $
      L_n (t) = 1/n! e^t (t^n e^(-t))^((n)).
    $
]

#exercise[
  Проверить, что 3-5 --- ортонормированные системы многочленов.
]

#th[
  Все эти многочлены --- базисы.
]

#proof[
  Ортогональность есть, надо доказать $Cl Lin {"многочлены"} = L^2$.
  $
    Lin {P_1, P_2, ...} = Lin {1, t, t^2, ...}
  $
  --- а это все многочлены. Надо доказать, что замыкание всех многочленов это $L^2$. Мы докажем только для многочленов из пунктов 1-3, да и то творчески, сославшись на теорему из будущего. Надо понять, что любую функцию из $L^2$ можно приблизить многочленом. Берем $eps > 0$ и $f in L^2$. Тогда найдется $g in L^2$ непрерывная такая, что $norm(f - g)_2 < eps$. По теореме Вейерштрасса (докажем позже#rf("weierstrass2"), хотя на практиках уже), любую непрерывную функцию на отрезке можно равномерно приблизить многочленом. Тогда существует $h$ --- многочлен такой, что $norm(g - h)_oo < eps$. Знаем
  $
    norm(g - h)_2 <= (mu [a, b])^(1/2) norm(g - h)_oo < C eps ==> norm(f - h)_2 <= norm(f - g)_2 + norm(g - h)_2 < (C + 1) eps
  $
  в $L^2 ((a, b), mu)$.
]

#def[
  Пусть $(X, rho)$ --- метрическое пространство, $A subset X$ непустое, $x in X$. Обозначим $E_A (x) = rho(x, A) = inf {rho(x, a): a in A}$. Это называется _расстоянием от точки $x$ до множества $A$_.

  Если на $y^* in A$ достигается $inf$, то есть $rho(x, y^*) = rho(x, A)$, то $y^*$ --- _элемент наилучшего приближения_.
]

#lemma(name: "тождество параллелограмма")[
  Следующее равенство равносильно наличию в пространстве скалярного произведения, но нам нужно только то, что в пространстве со скалярным произведением оно выполнено.
  $
    norm(x + y)^2 + norm(x - y)^2 = 2 norm(x)^2 + 2 norm(y)^2.
  $
]

#proof[
  Доказываем только вторую часть. Запишем нормы через скалярные произведения:
  $
    dotp(x + y, x + y) + dotp(x - y, x - y) = 2 dotp(x, x) + 2 dotp(y, y)
  $
  и раскроем скобки:
  $
    dotp(x, x) + cancel(dotp(x, y)) + cancel(dotp(y, x)) + dotp(y, y) + dotp(x, x) - cancel(dotp(x, y)) - cancel(dotp(y, x)) + dotp(y, y) = 2 dotp(x, x) + 2 dotp(y, y).
  $
]

#th(name: "о наилучшем приближении")[
  $A subset H$ --- непустое, замкнутое, выпуклое; $x in H$. Тогда существует единственный элемент наилучшего приближения.
]

#proof[
  Пусть $d := rho(x, A)$. Пусть $y, z in A$. Тогда $(y + z)/2 in A$ из-за выпуклости. Подставим в тождество параллелограмма $x - y$ и $x - z$:
  $
    norm(2x - y - z)^2 + norm((x - y) - (x - z))^2 = 2norm(x - y)^2 + 2norm(x - z)^2.
  $
  А еще,
  $
    norm(2x - y - z)^2 = norm(2(x - (y + z)/2))^2 = 4 norm(x - (y + z)/2)^2 >= 4d^2.
  $
  Тогда
  $
    norm(y - z)^2 <= 2(norm(x - y)^2 + norm(x - z)^2 - 2d^2).
  $
  Рассмотрим последовательность $a_n in A$ такая, что $rho(x, a_n) --> d$. Подставим разные индексы в неравенство выше вместо ранее произвольных $x$ и $y$:
  $
    norm(a_n - a_k)^2 <= 2 (norm(x - a_k)^2 + norm(x - a_n)^2 - 2d^2),
  $
  а последняя штука маленькая при больших $n$. Значит $a_n$ --- фундаментальная, и у нее есть предел в $a^* in H$, и из замкнутости он в $A$. Проверим, что $norm(x - a^*) = d$. Ну... ну да:
  $
    norm(x - a_n) --> norm(x - a^*) = d.
  $
  Теперь докажем единственность. Пусть $norm(x - a^*) = norm(x - b^*) = d$. Подставляем в то же неравенство:
  $
    norm(a^* - b^*)^2 <= 2(norm(x - a^*)^2 + norm(x - b^*)^2 - 2d^2) = 0 ==> a^* = b^*.
  $
]

#th(name: "об ортогональной проекции")[
  Пусть $H$ --- гильбертово, $L subset H$ --- замкнутое подпространство, $x in H$. Тогда $x$ единственным образом представляется в виде суммы $x = y + z$, где $y in L$, а $z perp L$. Такой $y$ называется _ортогональной проекцией_, и этот $y$ --- элемент наилучшего приближения к $x$ в $L$.
]

#proof[
  Пусть $y$ --- элемент наилучшего приближения к $x$ в $L$, он существует по предыдущей теореме. $z := x - y$. Надо проверить, что $z perp L$, остальное получилось само.

  Возьмем $l in L$. Тогда $y + lambda l in L$ для любого $lambda in RR$ (или $CC$). Тогда
  $
    norm(z - lambda l)^2 = norm(x - (y + lambda l))^2 >= norm(x - y)^2 = norm(z)^2.
  $
  Раскроем скобки в первой норме:
  $
    norm(z - lambda l)^2 = dotp(z - lambda l, z - lambda l) = norm(z)^2 + abs(lambda)^2 norm(l)^2 - underbrace(dotp(z, lambda l), cj(lambda) dotp(z, l)) - underbrace(dotp(lambda l, z), lambda cj(dotp(z, l))) newline(==>)
    abs(lambda)^2 norm(z)^2 >= cj(lambda) dotp(z, l) + lambda cj(dotp(z, l)).
  $
  Подставим $lambda = dotp(z, l)/norm(l)^2$:
  $
    abs(dotp(z, l))^2/norm(l)^4 dot norm(l)^2 >= abs(dotp(z, l)^2)/norm(l)^2 + abs(dotp(z, l)^2)/norm(l)^2.
  $
  Значит $abs(dotp(z, l))^2 >= 2 abs(dotp(z, l))$, значит $dotp(z, l) = 0$, но $l in L$ --- любой ненулевой вектор. Значит есть $x perp L$.
]

#def[
  Пусть $L$ --- замкнутое подпространство $H$. _Ортогональное дополнение_ $L^perp = {x in H: x perp L}$.
]

#def[
  Пусть $L$ --- замкнутое подпространство $H$. Оператор ортогонального проецирования $P_L x = "ортогональная проекция" x "на" L$.
]

#props[
  1. $P_L$ --- линейный оператор.
  2. Если $L != {0}$, то $norm(P_L) = 1$.
  3. $P_(L^perp) = Id - P_L$.
  4. $(L^perp)^perp = L$.
]

#proof[
  1. Берем $x = y + z$, $y in L$, $z perp L$, и $tilde(x) = tilde(y) + tilde(z)$, $tilde(y) in L$, $tilde(z) in L$, тогда
    $
      alpha x + tilde(alpha) tilde(x) = underbrace(alpha y + tilde(alpha) tilde(y), in L) + underbrace(alpha z + tilde(alpha) tilde(z), perp L) ==>
      P_L (alpha x + tilde(alpha) tilde(x)) = alpha y + tilde(alpha) tilde(y) = alpha P_L x + tilde(alpha) P_L tilde(x). 
    $
  
  2. Берем $x = y + z$, $y in L$, $z perp L$. Тогда $norm(x)^2 = norm(y)^2 + norm(z)^2 >= norm(y)^2$. Значит $norm(x) >= norm(P_L x)$, значит $norm(P_L) <= 1$. Если $x in L$, то $P_L x = x$, значит $norm(P_L) = 1$.

  3. Берем $x = y + z$, $y in L$, $z in L^T$. Тогда $x = P_L x + P_(L^perp) x$, то есть $Id = P_L + P_(L^perp)$.

  4. $P_((L^perp)^perp) = Id - P_(L^perp) = Id - (Id - P_L) = P_L$, значит $L = P_L (H) = P_((L^perp)^perp) (H) = (L^perp)^perp$.
]

#def[
  Пусть $(X, rho)$ --- метрическое пространство. Назовем его _сепарабельным_, если в нем есть счетное, всюду плотное множество.
]

#examples[
  1. $RR^d$: $QQ^d$ --- счетное, всюду плотное.
  2. $L^p (RR^d, lambda_d)$: плотны ступенчатые функции с рациональными значениями и ступеньками по ячейкам с рациональными координатами вершин. Доказательство остается читателю.
]

#th[
  В сепарабельном гильбертовом пространстве существует не более чем счетный ортонормированный базис.
]

#proof[
  Рассматриваем ${x_n}$ --- счетное, всюду плотное множество. "Просеем" это множество, и получим подмножество ${y_n}$ --- линейно независимое: тогда $Lin {x_n} = Lin {y_n}$. Ортогонализируем Граммом-Шмидтом. $Lin {x_n} = Lin {y_n} = Lin {e_n}$. Тогда $H = Cl {x_n} subset Cl Lin {x_n} = Cl Lin {e_n}$.
]

#th[
  Бесконечномерное сепарабельное гильбертово пространство изометрично $l^2$. То есть существует биекция, сохраняющая линейность и расстояние.
]

#proof[
  Пусть $H$ --- сепарабельное Гильбертово. Рассмотрим его ортонормированный базис $e_1$, $e_2$, .... Он счетный, так как пространство бесконечномерное. Сопоставим $x arrow.long.bar c_n (x) = dotp(x, e_n)/norm(e_n)^2$. Это линейное отображение, поэтому линейность сохраняется. Расстояния тоже:
  $
    norm(x)^2 =
    sum_(n=1)^oo abs(c_n (x))^2 underbrace(norm(e_n)^2, 1) =
    sum_(n=1)^oo abs(c_n (x))^2 =
    norm({c_n (x)})_(l^2)^2.
  $
  Более того, скалярное произведение тоже не меняется. Можно проверить аналогичным рассуждением для $dotp(x, y)$.
]
