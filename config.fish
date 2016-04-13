function virtualenv_paths --on-event virtualenv_did_activate:velocity-env
        # set pythonpath and settings module
        set -gx PYTHONPATH ~/workspace/webfuels/velocity
        set -gx DJANGO_SETTINGS_MODULE "velocity.settings.servers.developers.dev_atanas_a"

        # make manage.py usable from anywhere while the virtualenv is active
        function manage
                python ~/workspace/webfuels/velocity/manage.py $argv
        end
        
        # set up autocompletions
        function list_django_commands
                manage | python -c "import sys; print '\n'.join([c.replace('    ', '') for c in sys.stdin.read().split('Available subcommands')[1].split('\n') if c.startswith('    ')])"
        end

        complete -x -c manage -a "(list_django_commands)"
end
eval (python -m virtualfish)

