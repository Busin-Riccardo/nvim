; inherits: typescript

(call_expression
  function: (
             (identifier) @_name
             (#eq? @_name "gql")
  )
  arguments: (
              (arguments
                (template_string) @injection.content
                (#set! injection.language "graphql")
              )
  )
)

(call_expression
    function: (
        (await_expression (identifier) @_name)
        (#eq? @_name "sql")
    )
    arguments: (
        (template_string (string_fragment) @injection.content)
        (#set! injection.language "sql")
    )
)
