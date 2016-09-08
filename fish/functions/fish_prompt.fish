function fish_prompt
	if not set -q -g __fish_oct82_prompt
    set -g __fish_oct82_prompt

    function _branch
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end

    function _state
      if [ (echo (git status -s --ignore-submodules=dirty ^/dev/null)) ]
        echo " :["
      else
        echo " :]"
      end
    end
  end

  set -l grey (set_color -o 555)
  set -l green (set_color -o 050)
  set -l normal (set_color normal)

  echo -n -s $grey'['(basename (prompt_pwd))' '$green(_branch)$grey(_state)$normal' $ '
end
