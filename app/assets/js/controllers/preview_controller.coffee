Application.controller "previewController", ['$scope', '$http', '$rootScope'], ($scope, $http, $rootScope) ->
  $scope.colorized = '''
<span class='l l-1 source coffee'>Application<s class='meta delimiter method period coffee'>.</s>directive <s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>scopeBar<s class='punctuation definition string end coffee'>"</s></s><s class='meta delimiter object comma coffee'>, </s><s class='meta brace square coffee'>[</s><s class='meta brace square coffee'>]</s><s class='meta delimiter object comma coffee'>, </s><s class='keyword operator coffee'>-</s><s class='keyword operator coffee'>></s>
</span><span class='l l-2 source coffee'>  <s class='variable assignment coffee'><s class='variable assignment coffee'>replace<s class='punctuation separator key-value'>:</s></s></s> <s class='constant language boolean true coffee'>true</s>
</span><span class='l l-3 source coffee'>  <s class='variable assignment coffee'><s class='variable assignment coffee'>templateUrl<s class='punctuation separator key-value'>:</s></s></s> <s class='string quoted single coffee'><s class='punctuation definition string begin coffee'>'</s>partials/scope_bar<s class='punctuation definition string end coffee'>'</s></s>
</span><span class='l l-4 source coffee'>
</span><span class='l l-5 source coffee'><s class='meta function coffee'>  <s class='entity name function coffee'>link</s></s><s class='keyword operator coffee'>:</s> <s class='meta inline function coffee'><s class='variable parameter function coffee'>(scope, element, attr)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-6 source coffee'>    <s class='variable assignment coffee'><s class='variable assignment coffee'>preview <s class='keyword operator coffee'>=</s></s></s> element<s class='meta delimiter method period coffee'>.</s>prev<s class='meta brace round coffee'>(</s><s class='meta brace round coffee'>)</s>
</span><span class='l l-7 source coffee'>    preview<s class='meta delimiter method period coffee'>.</s>bind <s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>mouseover<s class='punctuation definition string end coffee'>"</s></s><s class='meta delimiter object comma coffee'>, </s><s class='meta inline function coffee'><s class='variable parameter function coffee'>(event)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-8 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>active <s class='keyword operator coffee'>=</s></s></s> <s class='meta brace curly coffee'>{</s><s class='meta brace curly coffee'>}</s>
</span><span class='l l-9 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>active.scope <s class='keyword operator coffee'>=</s></s></s> event<s class='meta delimiter method period coffee'>.</s>target<s class='meta delimiter method period coffee'>.</s>dataset<s class='meta delimiter method period coffee'>.</s>entityScope
</span><span class='l l-10 source coffee'>
</span><span class='l l-11 source coffee'>      <s class='keyword control coffee'>if</s> active<s class='meta delimiter method period coffee'>.</s>scope
</span><span class='l l-12 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>active_scope_rule <s class='keyword operator coffee'>=</s></s></s> getScopeSettings<s class='meta brace round coffee'>(</s>active<s class='meta delimiter method period coffee'>.</s>scope<s class='meta brace round coffee'>)</s>
</span><span class='l l-13 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>active.name <s class='keyword operator coffee'>=</s></s></s> active_scope_rule<s class='meta delimiter method period coffee'>.</s>name <s class='keyword control coffee'>if</s> active_scope_rule
</span><span class='l l-14 source coffee'>
</span><span class='l l-15 source coffee'>      scope<s class='meta delimiter method period coffee'>.</s>$apply <s class='keyword operator coffee'>-</s><s class='keyword operator coffee'>></s>
</span><span class='l l-16 source coffee'>        <s class='comment line coffee'><s class='punctuation definition comment coffee'>#</s> Highlight in sidebar
</s></span><span class='l l-17 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>scope.$parent.hovered_rule <s class='keyword operator coffee'>=</s></s></s> active_scope_rule
</span><span class='l l-18 source coffee'>
</span><span class='l l-19 source coffee'>    preview<s class='meta delimiter method period coffee'>.</s>bind <s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>mouseout<s class='punctuation definition string end coffee'>"</s></s><s class='meta delimiter object comma coffee'>, </s><s class='meta inline function coffee'><s class='variable parameter function coffee'>(event)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-20 source coffee'>      <s class='comment line coffee'><s class='punctuation definition comment coffee'>#</s> Unhighlight in sidebar
</s></span><span class='l l-21 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>scope.$parent.hovered_rule <s class='keyword operator coffee'>=</s></s></s> <s class='constant language null coffee'>null</s>
</span><span class='l l-22 source coffee'>
</span><span class='l l-23 source coffee'>    preview<s class='meta delimiter method period coffee'>.</s>bind <s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>dblclick<s class='punctuation definition string end coffee'>"</s></s><s class='meta delimiter object comma coffee'>, </s><s class='meta inline function coffee'><s class='variable parameter function coffee'>(event)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-24 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>active <s class='keyword operator coffee'>=</s></s></s> <s class='meta brace curly coffee'>{</s><s class='meta brace curly coffee'>}</s>
</span><span class='l l-25 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>active.scope <s class='keyword operator coffee'>=</s></s></s> event<s class='meta delimiter method period coffee'>.</s>target<s class='meta delimiter method period coffee'>.</s>dataset<s class='meta delimiter method period coffee'>.</s>entityScope
</span><span class='l l-26 source coffee'>
</span><span class='l l-27 source coffee'>      <s class='keyword control coffee'>if</s> active<s class='meta delimiter method period coffee'>.</s>scope
</span><span class='l l-28 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>active_scope_rule <s class='keyword operator coffee'>=</s></s></s> getScopeSettings<s class='meta brace round coffee'>(</s>active<s class='meta delimiter method period coffee'>.</s>scope<s class='meta brace round coffee'>)</s>
</span><span class='l l-29 source coffee'>        showPopover active_scope_rule<s class='meta delimiter object comma coffee'>, </s>event
</span><span class='l l-30 source coffee'>
</span><span class='l l-31 source coffee'>
</span><span class='l l-32 source coffee'>
</span><span class='l l-33 source coffee'><s class='meta function coffee'>    <s class='entity name function coffee'>showPopover </s></s><s class='keyword operator coffee'>=</s> <s class='meta inline function coffee'><s class='variable parameter function coffee'>(rule, event)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-34 source coffee'>      scope<s class='meta delimiter method period coffee'>.</s>$apply <s class='keyword operator coffee'>-</s><s class='keyword operator coffee'>></s>
</span><span class='l l-35 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>scope.$parent.new_popover_visible <s class='keyword operator coffee'>=</s></s></s> <s class='constant language boolean false coffee'>false</s>
</span><span class='l l-36 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>scope.$parent.popover_rule <s class='keyword operator coffee'>=</s></s></s> rule
</span><span class='l l-37 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>scope.$parent.edit_popover_visible <s class='keyword operator coffee'>=</s></s></s> <s class='constant language boolean true coffee'>true</s>
</span><span class='l l-38 source coffee'>
</span><span class='l l-39 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>popover <s class='keyword operator coffee'>=</s></s></s> $<s class='meta brace round coffee'>(</s><s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>#edit-popover<s class='punctuation definition string end coffee'>"</s></s><s class='meta brace round coffee'>)</s>
</span><span class='l l-40 source coffee'>
</span><span class='l l-41 source coffee'>      <s class='keyword control coffee'>if</s> popover<s class='meta delimiter method period coffee'>.</s><s class='keyword operator coffee'>is</s><s class='meta brace round coffee'>(</s><s class='string quoted single coffee'><s class='punctuation definition string begin coffee'>'</s>.slide<s class='punctuation definition string end coffee'>'</s></s><s class='meta brace round coffee'>)</s>
</span><span class='l l-42 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>left_offset <s class='keyword operator coffee'>=</s></s></s> $<s class='meta brace round coffee'>(</s><s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>#gallery<s class='punctuation definition string end coffee'>"</s></s><s class='meta brace round coffee'>)</s><s class='meta delimiter method period coffee'>.</s>width<s class='meta brace round coffee'>(</s><s class='meta brace round coffee'>)</s>
</span><span class='l l-43 source coffee'>      <s class='keyword control coffee'>else</s>
</span><span class='l l-44 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>left_offset <s class='keyword operator coffee'>=</s></s></s> <s class='constant numeric coffee'>0</s>
</span><span class='l l-45 source coffee'>
</span><span class='l l-46 source coffee'>      <s class='variable assignment coffee'><s class='variable assignment coffee'>offset <s class='keyword operator coffee'>=</s></s></s>
</span><span class='l l-47 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>left<s class='punctuation separator key-value'>:</s></s></s> <s class='meta brace round coffee'>(</s>popover<s class='meta delimiter method period coffee'>.</s>width<s class='meta brace round coffee'>(</s><s class='meta brace round coffee'>)</s> <s class='keyword operator coffee'>/</s> <s class='constant numeric coffee'>2</s><s class='meta brace round coffee'>)</s> <s class='keyword operator coffee'>+</s> <s class='constant numeric coffee'>10</s> <s class='keyword operator coffee'>+</s> left_offset
</span><span class='l l-48 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>top<s class='punctuation separator key-value'>:</s></s></s> <s class='constant numeric coffee'>24</s>
</span><span class='l l-49 source coffee'>
</span><span class='l l-50 source coffee'>      popover<s class='meta delimiter method period coffee'>.</s>css<s class='meta brace round coffee'>(</s><s class='meta brace curly coffee'>{</s>
</span><span class='l l-51 source coffee'>        <s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>left<s class='punctuation definition string end coffee'>"</s></s><s class='keyword operator coffee'>:</s> event<s class='meta delimiter method period coffee'>.</s>pageX <s class='keyword operator coffee'>-</s> offset<s class='meta delimiter method period coffee'>.</s>left
</span><span class='l l-52 source coffee'>        <s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>top<s class='punctuation definition string end coffee'>"</s></s><s class='keyword operator coffee'>:</s> event<s class='meta delimiter method period coffee'>.</s>pageY <s class='keyword operator coffee'>+</s> offset<s class='meta delimiter method period coffee'>.</s>top
</span><span class='l l-53 source coffee'>      <s class='meta brace curly coffee'>}</s><s class='meta brace round coffee'>)</s><s class='meta delimiter method period coffee'>.</s>addClass<s class='meta brace round coffee'>(</s><s class='string quoted double coffee'><s class='punctuation definition string begin coffee'>"</s>on-bottom<s class='punctuation definition string end coffee'>"</s></s><s class='meta brace round coffee'>)</s>
</span><span class='l l-54 source coffee'>
</span><span class='l l-55 source coffee'>
</span><span class='l l-56 source coffee'><s class='meta function coffee'>    <s class='entity name function coffee'>getScopeSettings </s></s><s class='keyword operator coffee'>=</s> <s class='meta inline function coffee'><s class='variable parameter function coffee'>(active_scope)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-57 source coffee'>      <s class='keyword control coffee'>return</s> <s class='keyword control coffee'>unless</s> scope<s class='meta delimiter method period coffee'>.</s>$parent<s class='meta delimiter method period coffee'>.</s>jsonTheme<s class='meta delimiter method period coffee'>.</s>settings
</span><span class='l l-58 source coffee'>
</span><span class='l l-59 source coffee'>      <s class='keyword control coffee'>return</s> scope<s class='meta delimiter method period coffee'>.</s>$parent<s class='meta delimiter method period coffee'>.</s>jsonTheme<s class='meta delimiter method period coffee'>.</s>settings<s class='meta delimiter method period coffee'>.</s>find <s class='meta inline function coffee'><s class='variable parameter function coffee'>(item)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-60 source coffee'>        <s class='keyword control coffee'>return</s> <s class='keyword control coffee'>unless</s> item<s class='meta delimiter method period coffee'>.</s>scope
</span><span class='l l-61 source coffee'>
</span><span class='l l-62 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>item_scopes <s class='keyword operator coffee'>=</s></s></s> item<s class='meta delimiter method period coffee'>.</s>scope<s class='meta delimiter method period coffee'>.</s>split<s class='meta brace round coffee'>(</s><s class='string quoted single coffee'><s class='punctuation definition string begin coffee'>'</s>, <s class='punctuation definition string end coffee'>'</s></s><s class='meta brace round coffee'>)</s>
</span><span class='l l-63 source coffee'>
</span><span class='l l-64 source coffee'>        <s class='variable assignment coffee'><s class='variable assignment coffee'>match <s class='keyword operator coffee'>=</s></s></s> item_scopes<s class='meta delimiter method period coffee'>.</s>filter <s class='meta inline function coffee'><s class='variable parameter function coffee'>(item_scope)</s> <s class='storage type function coffee'>-></s></s>
</span><span class='l l-65 source coffee'>          <s class='variable assignment coffee'><s class='variable assignment coffee'>item_scopes_arr <s class='keyword operator coffee'>=</s></s></s> item_scope<s class='meta delimiter method period coffee'>.</s>split<s class='meta brace round coffee'>(</s><s class='string quoted single coffee'><s class='punctuation definition string begin coffee'>'</s>.<s class='punctuation definition string end coffee'>'</s></s><s class='meta brace round coffee'>)</s>
</span><span class='l l-66 source coffee'>          <s class='variable assignment coffee'><s class='variable assignment coffee'>active_scope_arr <s class='keyword operator coffee'>=</s></s></s> active_scope<s class='meta delimiter method period coffee'>.</s>split<s class='meta brace round coffee'>(</s><s class='string quoted single coffee'><s class='punctuation definition string begin coffee'>'</s>.<s class='punctuation definition string end coffee'>'</s></s><s class='meta brace round coffee'>)</s>
</span><span class='l l-67 source coffee'>
</span><span class='l l-68 source coffee'>          <s class='keyword control coffee'>return</s> <s class='meta brace round coffee'>(</s>item_scopes_arr<s class='meta delimiter method period coffee'>.</s>subtract active_scope_arr<s class='meta brace round coffee'>)</s><s class='meta delimiter method period coffee'>.</s>length <s class='keyword operator coffee'><</s> <s class='constant numeric coffee'>1</s>
</span><span class='l l-69 source coffee'>
</span><span class='l l-70 source coffee'>        <s class='keyword control coffee'>return</s> item <s class='keyword control coffee'>if</s> match<s class='meta delimiter method period coffee'>.</s>length
</span>
'''
  # $scope.current_lang = "javascript"
  # $scope.lang_path = "/files/languages/#{$scope.current_lang}.tmLanguage"
  # $scope.sample_path = "/files/samples/#{$scope.current_lang}.txt"
  # $scope.available_langs = ['javascript', 'coffeescript', 'html', 'ruby', 'python']

  # $scope.plist_lang = null
  # $scope.json_lang = null

  # $scope.$watch 'lang_path', (n,o) ->
  #   if $scope.lang_path
  #     $http.get($scope.lang_path).success (data) ->
  #       $scope.colorized = ""
  #       $scope.parsed_code = []
  #       $scope.scope = []
  #       $scope.plist_lang = data
  #       $scope.json_lang = plist_to_json($scope.plist_lang)
  #       $scope.single_line_patterns = single_line_patterns()
  #       $scope.multi_line_patterns = multi_line_patterns()
  #       #console.log "LANG:", $scope.json_lang
  #       #console.log "MULTI LINES:",  { patterns: $scope.multi_line_patterns }
  #       #console.log "SINGLE LINES:", { patterns: $scope.single_line_patterns }
  #       $http.get($scope.sample_path).success (code) ->
  #         $scope.code = code
  #         #$scope.code = "#!/usr/bin/env node"
  #         $scope.parse()

  # $scope.set_lang = (lang) ->
  #   #console.log lang
  #   $scope.current_lang = lang
  #   $scope.sample_path = "/files/samples/#{lang}.txt"
  #   $scope.lang_path = "/files/languages/#{lang}.tmLanguage"

  # single_line_patterns = ->
  #   patterns = $scope.json_lang.patterns.findAll (p)-> !p.begin
  #   #console.log "single_line_patterns before cleanup", patterns
  #   patterns = cleanup(patterns)
  #   return patterns

  # multi_line_patterns  = ->
  #   patterns = $scope.json_lang.patterns.findAll (p)->  p.begin
  #   #console.log "multi_line_patterns before cleanup", patterns
  #   patterns = cleanup(patterns)
  #   return patterns

  # $scope.parse = ->
  #   parse_single_line_patterns()
  #   parse_multi_line_patterns()
  #   colorize()
  #   $scope.colorized = $scope.parsed_code.join('\n')

  # parse_single_line_patterns = ->
  #   for line, line_number in $scope.code.split("\n")
  #     for pattern,i in $scope.single_line_patterns
  #       #continue unless [4].find(i)
  #       $scope.scope[line_number] = [] unless $scope.scope[line_number]
  #       try
  #         regex = new RegExp(pattern.match, "g")
  #         #console.log regex
  #         if pattern.captures
  #           line = line.replace regex, (full_match, sub_matches..., position, full_line) ->
  #             #console.log "Full Match: ", full_match
  #             # console.log "Sub Matched: ", sub_matches
  #             # console.log "Position: ", position
  #             scope = {}
  #             begin_scope = {}
  #             begin_scope.pos  = position
  #             begin_scope.size = full_match.length
  #             begin_scope.name = pattern.name
  #             begin_scope.text = full_match
  #             begin_scope.type = "b"
  #             $scope.scope[line_number].push begin_scope
  #             end_scope = {}
  #             end_scope.pos    = begin_scope.pos + full_match.length
  #             end_scope.size   = full_match.length
  #             end_scope.name   = pattern.name
  #             end_scope.text   = full_match
  #             end_scope.type   = "e"
  #             $scope.scope[line_number].push end_scope

  #             for sub, i in sub_matches
  #               continue unless sub
  #               continue unless pattern.captures[i+1]
  #               continue if sub.isBlank()
  #               begin_scope = {}
  #               begin_scope.pos  = full_line.search(RegExp.escape(sub))
  #               begin_scope.size = sub.length
  #               # console.log pattern
  #               # console.log line
  #               # console.log "------------------------------"
  #               begin_scope.name = pattern.captures[i+1]?.name
  #               begin_scope.text = sub
  #               begin_scope.type = "b"
  #               $scope.scope[line_number].push begin_scope
  #               end_scope = {}
  #               end_scope.pos    = begin_scope.pos + sub.length
  #               end_scope.size   = sub.length
  #               end_scope.name   = pattern.captures[i+1]?.name
  #               end_scope.text   = sub
  #               end_scope.type   = "e"
  #               $scope.scope[line_number].push end_scope
  #             'ت'.repeat(full_match.length)
  #         else
  #           line = line.replace regex, (full_match, sub_matches..., position, full_line) ->
  #             # console.log "Full Match: ", full_match
  #             # console.log "Sub Matched: ", sub_matches
  #             # console.log "Position: ", position
  #             if full_match
  #               # if pattern.lb
  #               #   console.log sub_matches.compact()
  #               scope = {}
  #               begin_scope = {}
  #               begin_scope.pos  = position
  #               begin_scope.size = full_match.length
  #               begin_scope.name = pattern.name
  #               begin_scope.text = full_match
  #               begin_scope.type = "b"
  #               $scope.scope[line_number].push begin_scope
  #               end_scope = {}
  #               end_scope.pos    = begin_scope.pos + full_match.length
  #               end_scope.size   = full_match.length
  #               end_scope.name   = pattern.name
  #               end_scope.text   = full_match
  #               end_scope.type   = "e"
  #               $scope.scope[line_number].push end_scope
  #             'ت'.repeat(full_match.length)
  #       catch err
  #         console.error "Error parsing regex `#{pattern.name}` #{i}: "
  #       #console.log $scope.scope[line_number]
  #       #console.log line
  #       #console.log "--------------------------"

  # parse_multi_line_patterns = ->
  #   code = $scope.code
  #   for pattern,i in $scope.multi_line_patterns
  #     # 4: has look behinds that are not supported in js
  #     #continue if [4].find(i)
  #     #console.log "[#{i}] ", pattern
  #     regex = XRegExp("(#{pattern.begin})([\\s\\S]+?)(#{pattern.end})", "g")
  #     code.replace regex, (full_match, sub_matches..., position, full_line) ->
  #       begin_scope = {}
  #       begin_scope.line  = code.to(position).split("\n").length - 1
  #       begin_scope.pos   = code.to(position).split("\n").last().length
  #       begin_scope.size  = full_match.length
  #       begin_scope.name  = pattern.name
  #       begin_scope.text  = full_match
  #       begin_scope.type  = "b"
  #       #console.log scope
  #       $scope.scope[begin_scope.line].push begin_scope
  #       end_scope = {}
  #       end_scope.line  = code.to(position + full_match.length).split("\n").length - 1
  #       end_scope.pos   = code.to(position + full_match.length).split("\n").last().length
  #       end_scope.size  = full_match.length
  #       end_scope.name  = pattern.name
  #       end_scope.text  = full_match
  #       end_scope.type  = "e"
  #       #console.log scope
  #       $scope.scope[end_scope.line].push end_scope

  #       if begin_scope.line == end_scope.line
  #         for scope in $scope.scope[begin_scope.line]
  #           scope.name = pattern.name if scope.pos > begin_scope.pos && scope.pos < end_scope.pos
  #       else
  #         begin_scope.line.upto end_scope.line, (line) ->
  #           if line == begin_scope.line
  #             for scope in $scope.scope[line]
  #               scope.name = pattern.name if scope.pos > begin_scope.pos
  #           else if line == end_scope.line
  #             for scope in $scope.scope[line]
  #               scope.name = pattern.name if scope.pos < end_scope.pos
  #           else
  #             $scope.scope[line] = []


  #       full_match

  #     # if pattern.contentName
  #     #   cn_regex = XRegExp("(?:#{pattern.begin})([\\s\\S]+?)(?:#{pattern.end})", "g")
  #     #   code.replace cn_regex, (full_match, sub_matches..., position, full_line) ->
  #     #     begin_scope = {}
  #     #     begin_scope.line  = code.to(position).split("\n").length - 1
  #     #     begin_scope.pos   = code.to(position).split("\n").last().length
  #     #     begin_scope.size  = full_match.length
  #     #     begin_scope.name  = pattern.contentName
  #     #     begin_scope.text  = full_match
  #     #     begin_scope.type  = "b"
  #     #     #console.log scope
  #     #     $scope.scope[begin_scope.line].push begin_scope
  #     #     end_scope = {}
  #     #     end_scope.line  = code.to(position + full_match.length).split("\n").length - 1
  #     #     end_scope.pos   = code.to(position + full_match.length).split("\n").last().length
  #     #     end_scope.size  = full_match.length
  #     #     end_scope.name  = pattern.contentName
  #     #     end_scope.text  = full_match
  #     #     end_scope.type  = "e"
  #     #     #console.log scope
  #     #     $scope.scope[end_scope.line].push end_scope
  #     #     # Removing all the scopes between begin end end
  #     #     full_match

  #     # begin_regex = XRegExp("(#{pattern.begin})(?:[\\s\\S]+?)(?:#{pattern.end})", "g")
  #     # code.replace begin_regex, (full_match, sub_matches..., position, full_line) ->
  #     #   #console.log sub_matches
  #     #   for sub, i in sub_matches
  #     #     continue if sub.isBlank()
  #     #     scope = {}
  #     #     scope.start = full_line.search(RegExp.escape(sub))
  #     #     scope.size  = sub.length
  #     #     scope.name  = pattern.beginCaptures[i].name
  #     #     scope.text  = sub
  #     #     #console.log scope
  #     #     $scope.multi_line_scope.push scope
  #     #   full_match

  #     # end_regex = XRegExp("(?:#{pattern.begin})(?:[\\s\\S]+?)(#{pattern.end})", "g")
  #     # code.replace end_regex, (full_match, sub_matches..., position, full_line) ->
  #     #   #console.log sub_matches
  #     #   for sub, i in sub_matches
  #     #     continue if sub.isBlank()
  #     #     scope = {}
  #     #     scope.start = full_line.search(RegExp.escape(sub))
  #     #     scope.size  = sub.length
  #     #     scope.name  = pattern.endCaptures[i].name
  #     #     scope.text  = sub
  #     #     #console.log scope
  #     #     $scope.multi_line_scope.push scope
  #     #   full_match

  # cleanup = (patterns) ->
  #   #console.log patterns
  #   for pattern in patterns
  #     if pattern.include
  #       if $scope.json_lang.repository[pattern.include.replace("#","")]
  #         Object.merge(pattern, $scope.json_lang.repository[pattern.include.replace("#","")])
  #       else if pattern.include == "$self"
  #         # TODO: handle $self
  #       else
  #         console.log "local include was not found, probably an external one #{pattern.include}"

  #     if pattern.match
  #       if (/\(\?\<\=(.+?)\)/).test(pattern.match) || (/\(\?\<\!(.+?)\)/).test(pattern.match)
  #          #console.log pattern.match
  #          pattern.lb = true
  #       pattern.match = pattern.match.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g, "&")
  #                                     .replace(/\(\?\<\=(.+?)\)/, "($1)")
  #                                     .replace(/\(\?\<\!(.+?)\)/, "([^$1])")
  #       if pattern.match.match(/\(\?x\)/)
  #         pattern.match = pattern.match.replace(/\(\?x\)/,'').replace(/\s*#.+/g,'').replace(/\s+/g,'')

  #     if pattern.begin
  #       if (/\(\?\<\=(.+?)\)/).test(pattern.begin) || (/\(\?\<\!(.+?)\)/).test(pattern.begin)
  #          pattern.lb_begin = true
  #       pattern.begin = pattern.begin.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g, "&")
  #                                     .replace(/\(\?\<\=(.+?)\)/, "($1)")
  #                                     .replace(/\(\?\<\!(.+?)\)/, "([^$1])")
  #       # if pattern.begin.match(/\(\?x\)/)
  #       #   pattern.begin = pattern.begin.replace(/\(\?x\)/,'').replace(/\s*#.+/g,'').replace(/\s+/g,'')
  #       pattern.beginCaptures = [] unless pattern.beginCaptures

  #     if pattern.end
  #       if (/\(\?\<\=(.+?)\)/).test(pattern.end) || (/\(\?\<\!(.+?)\)/).test(pattern.end)
  #          pattern.lb_end = true
  #       pattern.end = pattern.end.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g, "&")
  #                                 .replace(/\(\?\<\=(.+?)\)/, "($1)")
  #                                 .replace(/\(\?\<\!(.+?)\)/, "([^$1])")
  #       # if pattern.end.match(/\(\?x\)/)
  #       #   pattern.end = pattern.end.replace(/\(\?x\)/,'').replace(/\s*#.+/g,'').replace(/\s+/g,'')
  #       pattern.endCaptures = [] unless pattern.endCaptures

  #     if pattern.captures && pattern.begin
  #        pattern.beginCaptures = pattern.captures
  #        pattern.endCaptures = pattern.captures

  #     if pattern.patterns
  #       for pat in pattern.patterns
  #         if pat && pat.include
  #           if $scope.json_lang.repository[pat.include.replace("#","")]
  #             Object.merge(pat, $scope.json_lang.repository[pat.include.replace("#","")])
  #           else if pat.include == "$self"
  #             # TODO: handle $self
  #           else
  #             console.log "local include was not found, probably an external one #{pat.include}"

  #       cleanup(pattern.patterns)
  #   return patterns

  # sorted_scope = (line_scope, line_number) ->
  #   sorted = line_scope && line_scope.sort (a,b) ->
  #     if a.pos < b.pos
  #       return -1
  #     else if a.pos > b.pos
  #       return 1
  #     else # if a.pos == b.pos
  #       if a.type != b.type && a.type == "e"
  #         return -1
  #       else if a.type != b.type && a.type == "b"
  #         return 1
  #       else # if a.type == b.type
  #         if (a.size > b.size && a.type == "b")  || (a.size < b.size && a.type == "e")
  #           return -1
  #         else if (a.size > b.size && a.type == "e") || (a.size < b.size && a.type == "b")
  #           return 1
  #         else
  #           console.log "can not determine the order of scopes, line #{line_number+1}", a, b, line_scope
  #           return 0
  #   sorted = [] unless sorted
  #   #console.log "[#{sorted.length}] Sorted uniq scope", sorted
  #   sorted

  # colorize = ->
  #   for line, line_number in $scope.code.split("\n")
  #     #console.log line
  #     scopes = sorted_scope($scope.scope[line_number], line_number)
  #     #console.log scopes
  #     for scope, i in scopes
  #       if scope.type == "b"
  #         tag = "<s class='#{scope.name?.split(".").join(" ")}' data-entity-scope='#{scope.name}'>"
  #       else
  #         tag = "</s>"
  #       #console.log "TAG:", tag
  #       line = line.insert(tag, scope.pos)
  #       j = i
  #       loop
  #         j += 1
  #         scopes[j] && scopes[j].pos = scopes[j].pos + tag.length
  #         break if j > scopes.length
  #     #console.log line
  #     $scope.parsed_code.push("<span class='l l-#{line_number} #{$scope.json_lang.scopeName.split(".").join(" ")}'>#{line}</span>")
