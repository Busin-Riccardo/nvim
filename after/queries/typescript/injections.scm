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
