{ config, pkgs, ... }:

{

  programs.git = {
    enable = true;
    userName = "Ed Page";
    ignores = ["/.tags"];
    aliases = {
      branch-name = "!git rev-parse --abbrev-ref HEAD";

      pullup = "pull --rebase upstream master";
      force-pull-upstream = "!git fetch upstream; git reset --hard upstream/master";

      co = "checkout";

      glog = "log --graph --all --oneline --decorate";

      unadd = "reset HEAD --";
      uncommit = "reset --soft HEAD~1";
      amend = "commit --amend --no-edit";

      publish = "!git push -u origin $(git branch-name)";
      unpublish = "!git push origin :$(git branch-name)";

      rebase-branch = "!git rebase -i `git merge-base master HEAD`";

      topic-start = "!branch=$1; git checkout master; git pull-upstream; git checkout -b \"$branch\"";
      topic-pull = "!branch=$(git branch-name); git checkout master; git pull-upstream; git checkout \"$branch\"; git rebase master";
      topic-push = "!branch=$(git branch-name); git push -u origin \"$branch\"";
    };
    extraConfig = {
      core.autocrlf = false;
      diff.algorithm = "histogram";
      push.default = "current";
      rebase.autosquash = true;
      "remote \"origin\"".prune = true;
    };
  };

}
