#import "../../utils/core.typ": *

== Ряды Лорана

#def[
    _Ряд Лорана_ --- ряд вида
    $
        sum_(n = -oo)^(oo) c_n (z - z_0)^n.
    $
    _Правильной частью_ ряда Лорана называется $sum_(n = 0)^oo c_n (z - z_0)^n$.
    _Главной частью_ ряда Лорана называется $sum_(n = -oo)^(-1) c_n (z - z_0)^n = sum_(m = 1)^oo c_(-m) (z - z_0)^(-m)$.

    Ряд _сходится_, если сходится его правильная и главная части.

    Далее мы будем писать все ряды при $z_0 = 0$.
]

#props[
    1. Сущесвуют $0 <= r <= R  <= +oo$ такие, что ряд Лорана $sum_(n = -oo)^oo c_n z^n$ сходится при $r < abs(z) < R$ и расходитс при $abs(z) < r$ или $abs(z) > R$.
]

#proof[
    1. $R$ --- радиус сходимости правильной части. Что с главной частью?
        $ sum_(m = 1)^oo c_(-m) (1/z)^m = sum_(m = 1)^oo c_(-m) w^m. $
        Это ряд, у которого есть радиус сходимости $tilde(R)$. Если $abs(w) < tilde(R)$, то ряд расходится, что есть если $abs(1/z) < tilde(R)$, или $abs(z) > 1/tilde(R)$. Аналогично, при $abs(w) > tilde(R)$ --- ряд расходится. $r = 1/tilde(R)$.

        Возмжно, $r$ получилось больше $R$. Тогда положим $r = R$, чтобы выло верно неравенство из свойства.

]

#def[
    Кольцо $r < abs(z) < R$ называется _кольцом сходимости_.
]

#props[
    2. В кольце строго внутри кольца сходимости $tilde(r) < abs(z) < tilde(R)$, сходимость равномерная.

    3. В кольце сходимости сумму можно дифференцировать сколь угодно много раз.
]

#proof[
    2. Из свойств степенных рядов, если уменьшить круг сходимости немного, сходимость будет равномерной. Сделаем это с кругами из доказательства свойства 1.

    3. Каждая точка строго внутри кольца лежит в каком-то уменьшенном кольце, а там есть равномерная сходимость.
]

#th[
    Если $f(z) = sum_(n = -oo)^oo c_n z^n$ при $r < abs(z) < R$, то коэффициенты определены однозначно. Замечу, что кольцо не пустое, так как какое-то значение $z$ в нем лежит.

    Более того, есть формула для коэффициентов:
    $
        c_n = 1/(2pi i) integral_(abs(z) = rho) (f(z))/(z^(n + 1)) dif z,
    $
    где $rho$ --- любое значение $r < rho < R$: по всем окружностям значения интегралов будут совпадать, как интегралы по гомотопным путям.
]

#proof[
    Считаем интеграл.
    $
        integral_(abs(z) = rho) (f(z))/(z^(n + 1)) dif z.
    $
    Параметризуем $z = rho e^(i t)$, $dif z = rho e^(i t) dot i dif t$:
    $
        integral_0^(2pi) sum_(k = -oo)^oo overbrace(c_k rho^k e^(i k t), f(z)) 1/underbrace(rho^(n + 1) e^(i (n + 1) t), z^(n + 1)) i rho e^(i t) dif t =
        i integral_0^(2pi) sum_(k = -oo)^(oo) c_k rho^(k - n) e^((k - n) i t) dif t newline(=^*) i sum_(k = -oo)^oo c_k rho^(k - n) integral_0^(2pi) e^(i (k - n) t) dif t.
    $
    Чему равен здесь интеграл?
    $
        integral_0^(2pi) e^(i m t) dif t = cases(
            2pi\, "при" m = 0,
            lr(e^(i m t)/(i m) bar)_(t = 0)^(t = 2pi) = 0\, "при" m != 0.
        )
    $
    Почему в $*$ можно менять местами интеграл и сумму? Мы выбрали $rho$ строго внутри кольца, поэтому для любого $rho$ и у главной, и у правильной части есть равномерная сходимость.

    Значит,
    $
        integral_(abs(z) = rho) (f(z))/(z^(n + 1)) dif z =
        2pi i c_n.
    $
    То есть если коэффициенты есть, то любые коэффициенты выражаются через наш интеграл. Значит, они определены однозначно.
]

#th(name: "Лорана")[
    $f$ голоморфна в кольце $r < abs(z) < R$. Тогда она в этом кольце раскладывается в ряд Лорана, то есть
    $
        f(z) = sum_(n = -oo)^oo a_n z^n, "где"
        a_n = 1/(2pi i) integral_(abs(z) = rho) f(z) / z^(n + 1) dif z.
    $

]

#proof[
    Возьмем $r < r_1 < r_2 < R_2 < R_1 < R$. Возьмем множество $r_1 <= abs(z) <= R_1$ --- компакт $K$, и точку в его внутренности, $r_2 < abs(z) < R_2$. Напишем по границе множества интегральную формулу Коши:
    $
        f(z) = 1/(2 pi i) integral_(diff K) f(zeta) / (zeta - z) dif zeta = 1/(2 pi i) integral_(abs(zeta) = R_1) f(zeta) / (zeta - z) dif zeta - 1/(2pi i) integral_(abs(zeta) = r_1) f(zeta) / (zeta - z) dif zeta.
    $

    Считаем по отдельности интегралы, начнем с первого. Распишем знаменатель как ряд:
    $
        1/(zeta - z) = 1/zeta dot 1/(1 - z/zeta) = 1/zeta sum_(n = 0)^oo (z/zeta)^n = sum_(n = 0)^oo z^n / (zeta^(n + 1)).
    $
    Тогда
    $
        integral_(abs(zeta) = R_1) f(zeta) / (zeta - z) dif zeta =
        integral_(abs(zeta) = R_1) z^n f(zeta) dot (sum_(n = 0)^oo 1/(zeta^(n + 1))) dif z =^*
        sum_(n = 0)^oo z^n underbrace(integral_(abs(zeta) = R_1) f(zeta)/(zeta^(n + 1)) dif z, := c_n) =
        sum_(n = 0)^oo c_n z^n.
    $
    Как обычно, надо объснить, почему можно переставлять в $*$ сумму с интегралом. Докажем равномерную сходимость. $f in H(r < abs(z) < R)$, значит $f in C(r_1 <= abs(z) <= R_1)$, то есть $f$ ограничена в кольце. $r_1 <= abs(z) <= R_1$, значит $abs(f(zeta)) <= M$ для каждого $zeta$. Тогда
    $
        abs(f(zeta)) abs(z)^n / (abs(zeta)^(n + 1)) <= M 1/R (R_2 / R_1)^n,
    $
    а это сходящая геометрическая прогрессия. По признаку Вейерштрасса, сходится.


    Теперь другой интеграл. Здесь, чтобы была сходимость, уже нужно писать ряд по $zeta/z$:
    $
        1/(zeta - z) = -1/z dot 1/(1 - zeta/z) = - 1/z sum_(n = 0)^oo zeta^n / z^n = -sum_(n = 1)^oo zeta^(n - 1)/z^n.
    $
    Аналогично считаем интеграл, меняем его местами с суммой по аналогичным причинам.
    $
        integral_(abs(zeta) = r_1) f(zeta)/(zeta - z) dif zeta = -integral_(abs(zeta) = r_1) f(zeta) -sum_(n = 1)^oo zeta^(n - 1)/z^n dif zeta = sum_(n = 1)^oo 1/(z^n) underbrace(integral_(abs(zeta) = r_1) f(zeta) zeta^(n - 1) dif zeta, "какие-то коэффициенты").
    $
    Получаем разложение в ряд.
]

#notice[
    Неравенство Коши верно для $n in ZZ$:
    $
        abs(a_n) <= M_rho / rho^n, "где" M_rho = max_(abs(zeta) = rho)abs(f(zeta)).
    $
]

#follow[
    Если $f$ голоморфна в кольце $r < abs(z) < R$, то сущесвует $g in H(abs(z) < R)$ и $h in H(abs(z) > R)$ такие, что $f = g + h$. Если $lim_(z -> oo) h(z) = 0$, то разложение единственно.
]

#proof[
    Пусть 
    $
        g(z) = sum_(n = 0)^oo a_n z^n, \
        h(z) = sum_(n = 1)^oo a_(-n) z^n.
    $
    Тогда $g$ сходится в кольце $r < abs(z) < R$, а значит и в $abs(z) < R$ (нет проблем со сходимостью около нуля), а значит $g in H(abs(z) < R)$. Тоже самое для $h$: она сходится при $abs(z) > r$, а значит голоморфна при $abs(z) > R$.

    Проверим единственность.
    Пусть $f = g + h = g_1 + h_1$, и $g, g_1 in H(abs(z) < R)$, и $h, h_1 in H(abs(z) > r)$. Тогда рассмотрим
    $
        F(z) := cases(
            g(z) - g_1 (z) "при" abs(z) < R,
            h(z) - h_1 (z) "при" abs(z) > r
        ) in H(CC).
    $
    Голоморфность следует из того, что голоморфны обе части в своих областях, и они совпадают в кольце. Значит $F$ является аналитическим продолжением каждой из функций. Кроме того, по условию, $F(z) --> 0$ при $z -> oo$. Значит эта функция меньше $1$ для всякого $abs(z) > A$, и ограничена при $abs(z) <= A$. Значит она ограничена везде, и по теореме Лиувилля, $F$ --- константа. Но $F$ обращается в ноль при $z -> 0$, значит $F = 0$.
]

#def[
    Если $f in H(0 < abs(z - a) < R)$, то $a$ называется _изолированной особой точкой_ функции $f$. Иными словами, функция не определена в точке $a$, но определена и голоморфна в некоторой окрестности этой точки.
]

#def[
    Определим бесконечные пределы: $ lim_(z -> a) f(z) = oo $ означает, что $abs(f(z)) -->_(z -> a) +oo$.
]

#def[
    Пусть $a$ --- изолированная особая точка.
    - Если сущесвует $lim_(z -> a) f(z) in CC$, то такая точка называется _устранимой особой точкой_.
    - Если $lim_(z -> a) f(z) = oo$, то такая точка называется _полюсом_.
    - Если не существует $lim_(z -> a) f(z)$, то такая точка называется _существенной особой точкой_.
]

#examples[
    + $f(z) = (sin z)/z$ имеет устранимую особую точку в нуле, так как при $z = 0$ предел равен $1$.
    + $f(z) = (e^z - 1)/z$ тоже самое.
    + $f(z) = (cos z)/z$ имеет полюс в нуле.
    + $f(z) = tg(z)$ имеет полюсы в точках $pi/2 + pi n$.
    + $f(z) = e^(1/z)$ имеет существенно особую точку в нуле, так как если $z_n = 1/(2pi i n)$, то $f(1/(1 pi i n)) = e^(2pi i n) = 1$, а если $z_n = 1/(2pi i n + pi)$, то $f(1/(1 pi i n + pi)) = e^(2pi i n + pi) = -1$.
]

#th(name: "характеристика устранимой особой точки")[
    $f = H(0 < abs(z - a) < R)$. Следующие условия равносильны:
    1. $a$ --- устранимая особая точка.
    2. $f$ ограничена в проколотой окрестности $a$.
    3. Существует $g in H(abs(z - a) < R)$ такая, что $f(z) = g(z)$ при $0 < abs(z - a) < R$.
    4. В главной части разложения Лорана $f$ в окрестности $a$ все коэффициенты равны нулю.
]

#proof[
    - "$1 ==> 2$": если сущесвует предел, то есть локальная ограниченность.
    - "$4 ==> 3$": если в главной части ряда Лорана все коэффициенты нулевые, то возьмем все остальное в качестве $g$. Такая $g$ подходит.
    - "$3 ==> 1$": $lim_(z -> a) f(z) = lim_(z -> a) g(z) = g(a)$.
    - "$2 ==> 4$": Пусть $abs(f(z)) <= M$ при $0 < abs(z - a) < r$. Тогда в ряде Лорана $c_n <= M_rho / rho^n <= M/rho^n --> 0$ при $rho -> 0$. Здесь $M_rho = max abs(f(z)) < M$ при $abs(z - a) = rho$.
]

#th(name: "характеристика полюса")[
    $f in H(0 < abs(z - a) < R)$. Следующие условия равносильны:
    1. $a$ --- полюс.
    2. Существует $m in NN$ и $g in H(abs(z - a) < R)$, такая, что $g(a) != 0$ и $f(z) = g(z) / (z - a)^m$ при $0 < abs(z - a) < R$.
    3. В главной части ряда Лорана (в кольце $0 < abs(z - a) < R$) $f$ есть только конечное *ненулевое* (иначе устранимо) число ненулевых коэффициентов.
]

#proof[
    - "$1 ==> 2$": Заведем $h(z) = 1/(f(z))$. Тогда $lim_(z -> a) f(z) = oo$, а значит $abs(f(z)) > 1$ в некоторой окрестности $a$, и для $h(z)$ это устранимая особая точка (в ней предел $0$). Доопределим эту функцию в точке $a$. Такая $h$ голоморфна в окрестности $a$, и равна нулю в точке. Можем вынести из нее множитель $(z - a)^m$, тогда
        $
            h(z) = (z - a)^m dot tilde(h) (z), " где" tilde(h) in H(abs(z - a) < r) "и " tilde(h)(a) != 0.
        $
        Ну а $f$, соответственно, равна $1/h$:
        $
            f(z) = 1/(z - a)^m dot 1/(tilde(h)(z)).
        $
        Берем $g(z) = 1/(tilde(h) (z))$ в окрестности $a$. Правда, эта функция пока определена при $abs(z - a) < r$. Давайте доопределим:
        $
            g(z) = cases(
                1/(tilde(h) (a)) "при" z = a,
                (z - a)^m f(z) "при" z != a
            ).
        $
        Она голоморфна, так как в точка $a$ --- устранимая особая точка $(z - a)^m f(z)$.

    - "$2 ==> 3$": Возьмем ряд Тейлора голоморфной функции в круге в точке $a$:
        $
            g(z) = sum_(n = 0)^oo c_n (z - a)^n.
        $
        Тогда 
        $
            f(z) = g(z) / (z - a)^m = sum_(n = -m)^oo c_(n + m) (z - a)^n.
        $
        В этом ряду действительно конечное ненулевое число ненулевых коэффициентов в главной части.
    - "$3 ==> 1$": $f(z) = sum_(n = -m)^oo c_n (z - a)^n$ и $c_(-m) != 0$. Значит $f(z) sim c_(-m)/(z - a)^m$.
]

#def[
    $m$ из этой теоремы называется _порядком полюса_.
]

#notice[
    В процессе доказательства поняли равносильность:
    1. $a$ --- полюс $f$ порядка $m$.
    2. $a$ --- нуль $1/f$ кратности $m$.
    3. $f(z) = sum_(n = -m)^oo c_n (z - a)^n$ и $c_m != 0$.
]

#def[
    $f$ --- _мероморфная_ в $Omega$ функция, если $f in H(Omega without E)$, а $E$ --- множество всех полюсов $f$. Устронимые особые точки тоже годяться, но их можно сразу устранить.
]

#notice[
    У множества $E$ нет предельных точек в $Omega$. Пусть $a_n$ --- полюсы $a_n in E$, и $lim a_n = a in Omega$. Тогда ни в каком кольце $0 < abs(z - a) < R$ не может быть голоморфности (то есть это не изолированная особая точка), иначе в окрестности $a$ не могло бы быть полюсов. В точке $a$ тоже голоморфности быть не может, так как
    $
        lim_(z -> a_n) f(z) = oo ==> exists z_n in U_(a_n): abs(f(z_n)) > n ==> z_n --> a "и " abs(f(z_n)) --> +oo. 
    $
    Получается предел --- не полюс, и не точка голоморфности. Значит эта точка не лежит в $Omega$, и не является предельной.
]

#example[
    $ctg 1/z$ мероморфная в $CC without {0}$, но не мероморфная в $CC$.
]

#proof[
    $f$, $g$ мероморфны в $Omega$. Тогда
    1. $f plus.minus g$ мероморфна в $Omega$.
    2. $f g$ мероморфна в $Omega$.
    3. $f/g$ мероморфна в $Omega$, если $g equiv.not 0$.
    4. $f'$ мероморфна в $Omega$.
]

#proof[
    1.
        $
            f(z) + g(z) = sum_(n = -m_1)^oo c_n (z - a)^n + sum_(n = -m_2)^oo d_n (z - a)^n.
        $
        Это ряд такого же вида, поэтому $f + g$ мероморфна.
    2. Если $f$ и $g$ голоморфны в $a$, то $f g$ голоморфна в $a$. Только в таких точках $f(a) = 0$ или $g(a) = 0$. В остальных точках распишем (такое представление сущесвует)
        $
            f(z) = (z - a)^m phi(z),\
            g(z) = (z - a)^l psi(z).
        $
        Тогда
        $
            f(z) g(z) = (z - a)^(m + l) phi(z) psi(z).
        $
    3. Аналогично,
        $
            f(z) / g(z) = (z - a)^(m - l) phi(z)/(psi(z)).
        $
        Если нули $g$ имеет предельную точку, то $g equiv 0$ по теореме о единственности, поэтому такие функции не рассматриваются.
    4. Если $f$ голоморфна в окрестнсоти $a$, то $f'$ тоже голоморфна в окрестности $a$. Если $a$ --- полюс, то
        $
            f'(z) = (-m phi(z) + phi'(z) (z - a))/(z - a)^(m + 1).
        $
        Полюс не исчезает.
]

#th(name: "характеристика существенной особой точки")[
    $f in H(0 < abs(z - a) < R)$. Следующие условия равносильны:
    1. $a$ --- существенно особая точка.
    2. В главной части ряда Лорана $f$ в окрестности $a$ бесконечно много ненулевых коэффициентов.
]

#proof[
    Получается по принципу исключения: по двум предыдущим теоремам ничего больше не остается.
]
