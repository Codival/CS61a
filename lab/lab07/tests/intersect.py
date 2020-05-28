test = {
  'name': 'intersect',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          scm> ((intersect add-two square) 2)
          #t
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          scm> ((intersect add-two square) 3)
          #f
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          scm> ((intersect (lambda (x) (* 5 x)) square) 5)
          #t
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          scm> ((intersect (lambda (x) x) square) 1)
          #t
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          scm> ((intersect square (lambda (x) x)) 1)
          #t
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          scm> ((intersect (lambda (x) x) square) 5)
          #f
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          scm> ((intersect (lambda (x) (/ x 1)) (lambda (x) x)) -1)
          #t
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': True,
      'setup': r"""
      scm> (load 'lab07)
      scm> (load 'lab07_extra)
      scm> (define (add-two a) (+ a 2))
      scm> (define (square a) (* a a))
      """,
      'teardown': '',
      'type': 'scheme'
    }
  ]
}
